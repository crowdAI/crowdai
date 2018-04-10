class CacheLeaderboardService

  def initialize(challenge_id:)
    @challenge = Challenge.find(challenge_id)
    @conn = ActiveRecord::Base.connection
  end

  def call
    ActiveRecord::Base.transaction do
      purge_leaderboard
      create_leaderboard(leaderboard_type: 'leaderboard')
      #create_leaderboard(leaderboard_type: 'ongoing')
      create_leaderboard(leaderboard_type: 'previous')
      #create_leaderboard(leaderboard_type: 'previous_ongoing')
      #update_leaderboard_rankings
      #update_ongoing_leaderboard_rankings
    end
    return true
  end

  def window_border_dttm
    most_recent = Submission
      .where(challenge_id: @challenge.id)
      .order(created_at: :desc)
      .limit(1)
      .first
    return most_recent.created_at - (@challenge.ranking_window / 24.0)
  end

  def most_recent_dttm
    most_recent = Submission
      .where(challenge_id: @challenge.id)
      .order(created_at: :desc)
      .limit(1)
      .first
    return most_recent.created_at
  end

  def purge_leaderboard
    ActiveRecord::Base.connection.execute "delete from lboards where challenge_id = #{@challenge.id};"
  end

  def create_leaderboard(leaderboard_type:)
    case leaderboard_type
    when 'leaderboard'
      post_challenge = '(FALSE)'
      cuttoff_dttm = most_recent_dttm
    when 'ongoing'
      post_challenge = '(TRUE,FALSE)'
      cuttoff_dttm = most_recent_dttm
    when 'previous'
      post_challenge = '(FALSE)'
      cuttoff_dttm = window_border_dttm
    when 'previous_ongoing'
      post_challenge = '(TRUE,FALSE)'
      cuttoff_dttm = window_border_dttm
    end

    sql = %Q[
      INSERT INTO lboards (
        id,
        challenge_id,
        challenge_round_id,
        participant_id,
        submission_id,
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
        refreshed_at,
        created_at,
        updated_at
      )
      SELECT
        nextval('lboards_id_seq'::regclass),
        l.challenge_id,
        l.challenge_round_id,
        l.participant_id,
        l.id,
        ROW_NUMBER() OVER (PARTITION by l.challenge_id,
                                        l.challenge_round_id
                          ORDER BY
                            CASE WHEN c.primary_sort_order_cd = 'ascending'
                              THEN l.score END ASC,
                            CASE WHEN c.primary_sort_order_cd = 'descending'
                              THEN l.score END DESC,
                            CASE WHEN c.secondary_sort_order_cd = 'ascending'
                              THEN l.score_secondary END ASC,
                            CASE WHEN c.secondary_sort_order_cd = 'descending'
                              THEN l.score_secondary END DESC ) AS ROW_NUM,
        0 as PREVIOUS_ROW_NUM,
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
        '#{leaderboard_type}',
        '#{DateTime.now.to_s(:db)}',
        l.created_at,
        l.updated_at
      FROM (SELECT
              row_number() OVER (PARTITION BY s.challenge_id,
                s.challenge_round_id, s.participant_id
                ORDER BY
                  CASE WHEN c.primary_sort_order_cd = 'ascending'
                       THEN s.score END ASC,
                  CASE WHEN c.primary_sort_order_cd = 'descending'
                       THEN s.score END DESC,
                  CASE WHEN c.secondary_sort_order_cd = 'ascending'
                       THEN s.score_secondary END ASC,
                  CASE WHEN c.secondary_sort_order_cd = 'descending'
                       THEN s.score_secondary END DESC) AS submission_ranking,
              s.id,
              s.challenge_id,
              s.challenge_round_id,
              s.participant_id,
              p.slug,
              p.name,
              cnt.entries,
              s.score,
              s.score_secondary,
              s.media_large,
              s.media_thumbnail,
              s.media_content_type,
              s.description,
              s.description_markdown,
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
                    WHERE c_1.post_challenge IN #{post_challenge}
                    AND c_1.created_at <= '#{cuttoff_dttm.to_s(:db)}'
                    GROUP BY c_1.challenge_id,
                             c_1.challenge_round_id,
                             c_1.participant_id) cnt
            WHERE p.id = s.participant_id
              AND s.challenge_id = c.id
              AND s.grading_status_cd::text = 'graded'::text
              AND s.post_challenge IN #{post_challenge}
              AND cnt.challenge_id = s.challenge_id
              AND cnt.challenge_round_id = s.challenge_round_id
              AND c_1.created_at <= '#{cuttoff_dttm.to_s(:db)}'
              AND cnt.participant_id = s.participant_id) l,
          challenges c
        WHERE l.submission_ranking = 1
        AND c.id = l.challenge_id
        AND c.id = #{@challenge.id}
        ORDER BY l.challenge_id,
          l.challenge_round_id,
          row_num;
    ]
    @conn.execute sql
  end


end
