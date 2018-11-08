class CalculateLeaderboardService

  def initialize(challenge_round_id:,run_dttm: DateTime.current)
    @round = ChallengeRound.find(challenge_round_id)
    @order_by = get_order_by
    @base_order_by = get_base_order_by
    @run_dttm = run_dttm
    @conn = ActiveRecord::Base.connection
    @snapshot_instance = nil
  end

  def call
    if @round.submissions.blank?
      purge_leaderboard
      return true
    end

    ActiveRecord::Base.transaction do
      truncate_scores
      purge_leaderboard
      create_leaderboard(leaderboard_type: 'leaderboard')
      create_leaderboard(leaderboard_type: 'ongoing')
      create_leaderboard(leaderboard_type: 'previous')
      create_leaderboard(leaderboard_type: 'previous_ongoing')
      update_leaderboard_rankings(
        leaderboard: 'leaderboard',
        prev: 'previous')
      update_leaderboard_rankings(
        leaderboard: 'ongoing',
        prev: 'previous_ongoing')
      insert_baseline_rows(leaderboard_type: 'leaderboard')
      insert_baseline_rows(leaderboard_type: 'ongoing')
      set_leaderboard_sequences(leaderboard_type: 'leaderboard')
      set_leaderboard_sequences(leaderboard_type: 'ongoing')
      snapshot_leaderboard(leaderboard_type: 'leaderboard')
      snapshot_leaderboard(leaderboard_type: 'ongoing')
      assign_points
      assign_badges
    end
    return true
  end

  def truncate_scores
    sql = %Q[
      update submissions
      set
        score_display = round(score::numeric,#{@round.score_precision}),
        score_secondary_display = round(score_secondary::numeric,#{@round.score_secondary_precision})
      where challenge_round_id = #{@round.id}
      and created_at <= TIMESTAMP WITH TIME ZONE '#{Time.zone.parse(@run_dttm)}'
    ]
    @conn.execute sql
  end

  def window_border_dttm
    most_recent = Submission
      .where(challenge_round_id: @round.id)
      .where("created_at <= ?", Time.zone.parse(@run_dttm))
      .order(created_at: :desc)
      .limit(1)
      .first
    window_border = most_recent.created_at - @round.ranking_window.hours
    return "'#{window_border.to_s(:db)}'"
  end

  def get_order_by
    challenge = @round.challenge
    if (challenge.secondary_sort_order_cd.blank? || challenge.secondary_sort_order_cd == 'not_used')
        return "score_display #{sort_map(challenge.primary_sort_order_cd)}"
    else
      return "score_display #{sort_map(challenge.primary_sort_order_cd)}, score_secondary_display #{sort_map(challenge.secondary_sort_order_cd)}"
    end
  end

  # TODO refactor this out
  def get_base_order_by
    challenge = @round.challenge
    if (challenge.secondary_sort_order_cd.blank? || challenge.secondary_sort_order_cd == 'not_used')
        return "score #{sort_map(challenge.primary_sort_order_cd)}"
    else
      return "score #{sort_map(challenge.primary_sort_order_cd)}, score_secondary #{sort_map(challenge.secondary_sort_order_cd)}"
    end
  end
  def sort_map(sort_field)
    case sort_field
    when 'ascending'
      return 'asc'
    when 'descending'
      return 'desc'
    else
      return nil
    end
  end

  def purge_leaderboard
    ActiveRecord::Base.connection.execute "delete from base_leaderboards where challenge_round_id = #{@round.id};"
  end

  def leaderboard_params(leaderboard_type:)
    case leaderboard_type
    when 'leaderboard'
      post_challenge = '(FALSE)'
      cuttoff_dttm = 'current_timestamp'
    when 'ongoing'
      post_challenge = '(TRUE,FALSE)'
      cuttoff_dttm = 'current_timestamp'
    when 'previous'
      post_challenge = '(FALSE)'
      cuttoff_dttm = window_border_dttm
    when 'previous_ongoing'
      post_challenge = '(TRUE,FALSE)'
      cuttoff_dttm = window_border_dttm
    end
    return [post_challenge,cuttoff_dttm]
  end

  def create_leaderboard(leaderboard_type:)
    post_challenge, cuttoff_dttm = leaderboard_params(leaderboard_type: leaderboard_type)

    sql = %Q[
      INSERT INTO base_leaderboards (
        id,
        challenge_id,
        challenge_round_id,
        participant_id,
        submission_id,
        seq,
        row_num,
        previous_row_num,
        slug,
        name,
        entries,
        score,
        score_secondary,
        media_large,
        media_thumbnail,
        media_content_type,
        description,
        description_markdown,
        leaderboard_type_cd,
        post_challenge,
        refreshed_at,
        created_at,
        updated_at
      )
      SELECT
        nextval('base_leaderboards_id_seq'::regclass),
        l.challenge_id,
        l.challenge_round_id,
        l.participant_id,
        l.id,
        0 as SEQ,
        ROW_NUMBER() OVER (
          PARTITION by l.challenge_id,
                       l.challenge_round_id
          ORDER BY #{@order_by} ) AS ROW_NUM,
        0 as PREVIOUS_ROW_NUM,
        l.slug,
        l.name,
        l.entries,
        l.score_display,
        l.score_secondary_display,
        l.media_large,
        l.media_thumbnail,
        l.media_content_type,
        l.description,
        l.description_markdown,
        '#{leaderboard_type}',
        l.post_challenge,
        '#{DateTime.now.to_s(:db)}',
        l.created_at,
        l.updated_at
      FROM (SELECT
              row_number() OVER (
                PARTITION BY s.challenge_id,
                             s.challenge_round_id,
                             s.participant_id
                ORDER BY #{@order_by}) AS submission_ranking,
              s.id,
              s.challenge_id,
              s.challenge_round_id,
              s.participant_id,
              p.slug,
              p.name,
              cnt.entries,
              s.score_display,
              s.score_secondary_display,
              s.media_large,
              s.media_thumbnail,
              s.media_content_type,
              s.description,
              s.description_markdown,
              s.post_challenge,
              s.created_at,
              s.updated_at
            FROM submissions s,
                 challenges c,
                 participants p,
                  ( SELECT c_1.challenge_id,
                           c_1.challenge_round_id,
                           c_1.participant_id,
                           count(c_1.*) AS entries
                    FROM submissions c_1
                    WHERE c_1.challenge_round_id = #{@round.id}
                    AND c_1.post_challenge IN #{post_challenge}
                    AND c_1.created_at <= #{cuttoff_dttm}
                    AND c_1.baseline IS FALSE
                    GROUP BY c_1.challenge_id,
                             c_1.challenge_round_id,
                             c_1.participant_id) cnt
            WHERE s.challenge_round_id = #{@round.id}
            AND s.grading_status_cd = 'graded'
            AND s.post_challenge IN #{post_challenge}
            AND s.created_at <= #{cuttoff_dttm}
            AND p.id = s.participant_id
            AND s.challenge_id = c.id
            AND cnt.challenge_id = s.challenge_id
            AND cnt.challenge_round_id = s.challenge_round_id
            AND cnt.participant_id = s.participant_id
            AND s.baseline IS FALSE) l,
          challenges c
        WHERE l.submission_ranking = 1
        AND c.id = l.challenge_id
        AND c.id = #{@round.challenge_id}
    ]
    @conn.execute sql
  end

  def update_leaderboard_rankings(leaderboard:, prev:)
    sql = %Q[
      WITH lb AS (
        SELECT l.row_num,
               p.row_num AS prev_row_num,
               l.challenge_id,
               l.challenge_round_id,
               l.participant_id
        FROM base_leaderboards l,
             base_leaderboards p
        WHERE l.challenge_id = p.challenge_id
        AND l.challenge_round_id = p.challenge_round_id
        AND l.challenge_round_id = #{@round.id}
        AND l.participant_id = p.participant_id
        AND l.leaderboard_type_cd = '#{leaderboard}'
        AND p.leaderboard_type_cd = '#{prev}')
      UPDATE base_leaderboards
      SET previous_row_num = lb.prev_row_num
      FROM lb
      WHERE base_leaderboards.leaderboard_type_cd = '#{leaderboard}'
      AND base_leaderboards.challenge_id = lb.challenge_id
      AND base_leaderboards.challenge_round_id = lb.challenge_round_id
      AND base_leaderboards.challenge_round_id = #{@round.id}
      AND base_leaderboards.participant_id = lb.participant_id
    ]
    @conn.execute sql
  end

  def insert_baseline_rows(leaderboard_type:)
    post_challenge, cuttoff_dttm = leaderboard_params(leaderboard_type: leaderboard_type)
    sql = %Q[
      INSERT INTO base_leaderboards (
        id,
        challenge_id,
        challenge_round_id,
        participant_id,
        submission_id,
        seq,
        row_num,
        previous_row_num,
        slug,
        name,
        entries,
        score,
        score_secondary,
        media_large,
        media_thumbnail,
        media_content_type,
        description,
        description_markdown,
        leaderboard_type_cd,
        post_challenge,
        baseline,
        baseline_comment,
        refreshed_at,
        created_at,
        updated_at
      )
      SELECT
        nextval('base_leaderboards_id_seq'::regclass),
        s.challenge_id,
        s.challenge_round_id,
        s.participant_id,
        s.id as submission_id,
        0 as seq,
        0 as row_num,
        0 as previous_row_num,
        NULL as slug,
        NULL as name,
        0 as entries,
        s.score,
        s.score_secondary,
        s.media_large,
        s.media_thumbnail,
        s.media_content_type,
        s.description,
        s.description_markdown,
        '#{leaderboard_type}',
        s.post_challenge,
        s.baseline,
        s.baseline_comment,
        '#{DateTime.now.to_s(:db)}',
        s.created_at,
        s.updated_at
      FROM submissions s
      WHERE s.challenge_round_id = #{@round.id}
      AND s.grading_status_cd = 'graded'
      AND s.post_challenge IN #{post_challenge}
      AND s.created_at <= #{cuttoff_dttm}
      AND s.baseline IS TRUE
    ]
    @conn.execute sql
  end

  def set_leaderboard_sequences(leaderboard_type:)
    post_challenge, cuttoff_dttm = leaderboard_params(leaderboard_type: leaderboard_type)
    sql = %Q[
        WITH lb AS (
        SELECT
          l.id,
          l.submission_id,
          l.row_num,
          ROW_NUMBER() OVER (
            PARTITION by l.challenge_id,
                         l.challenge_round_id,
                         l.leaderboard_type_cd
            ORDER BY #{@base_order_by},l.row_num asc) AS SEQ
        FROM base_leaderboards l
        WHERE l.challenge_round_id = #{@round.id})
      UPDATE base_leaderboards
      SET seq = lb.seq
      FROM lb
      WHERE base_leaderboards.id = lb.id
    ]
    @conn.execute sql
  end

  def set_snapshot_instance
    @snapshot_instance = BaseLeaderboard
      .where(
        challenge_round_id: @round.id,
        leaderboard_type_cd: leaderboard_type)
      .order(id: :desc)
      .limit(1)
      .pluck(:id)
      .first
  end

  def snapshot_leaderboard(leaderboard_type:)
    sql = %Q[
      INSERT INTO leaderboard_snapshots (
        snapshot_instance,
        challenge_id,
        challenge_round_id,
        participant_id,
        submission_id,
        seq,
        row_num,
        previous_row_num,
        slug,
        name,
        entries,
        score,
        score_secondary,
        media_large,
        media_thumbnail,
        media_content_type,
        description,
        description_markdown,
        leaderboard_type_cd,
        post_challenge,
        baseline,
        baseline_comment,
        refreshed_at,
        created_at,
        updated_at
      )
      SELECT
        #{@snapshot_instance},
        l.challenge_id,
        l.challenge_round_id,
        l.participant_id,
        l.submission_id,
        l.seq,
        l.row_num,
        NULL AS previous_row_num,
        l.slug,
        l.name,
        l.entries,
        l.score,
        l.score_secondary,
        l.media_large,
        l.media_thumbnail,
        l.media_content_type,
        l.description,
        l.description_markdown,
        l.leaderboard_type_cd,
        l.post_challenge,
        l.baseline,
        l.baseline_comment,
        l.refreshed_at,
        l.created_at,
        l.updated_at
      FROM base_leaderboards l,
      WHERE l.challenge_round_id = #{@round.id}
      AND l.leaderboard_type_cd = '#{leaderboard_type}'
    ]
    @conn.execute sql
  end

  def assign_points
    top_5 = LeaderboardSnapshot
      .where(snapshot_instance: @snapshot_instance)
      .order(seq: :asc)
      .limit(5)
    top_position(row: top5.first)
    top5_during(top5: top_5)
  end

  def top_position(row:)
    participant = Participant.find(row.partipant_id)
    participant.add_points(1, category: 'top-position-during')
  end

  def top5_during(top5:)
    top5.each do |row|
      participant = Participant.find(row.partipant_id)
      participant.add_points(1, category: 'top5-during')
    end
  end

  def assign_badges(top5:)
    top5.each do |row|
      participant = Participant.find(row.partipant_id)

      case participant.points(category: 'top-position-during')
      when 1
        badge = Merit::Badge.detect{|b| b.name == 'top-position-bronze'}
        participant.add_badge(badge.id)
      when 5
        badge = Merit::Badge.detect{|b| b.name == 'top-position-silver'}
        participant.add_badge(badge.id)
      when 25
        badge = Merit::Badge.detect{|b| b.name == 'top-position-gold'}
        participant.add_badge(badge.id)
      end

      case participant.points(category: 'top5-during')
      when 1
        badge = Merit::Badge.detect{|b| b.name == 'top5-during-bronze'}
        participant.add_badge(badge.id)
      when 5
        badge = Merit::Badge.detect{|b| b.name == 'top5-during-silver'}
        participant.add_badge(badge.id)
      when 25
        badge = Merit::Badge.detect{|b| b.name == 'top5-during-gold'}
        participant.add_badge(badge.id)
      end
    end
  end

end
