class CommentsDigestQuery

  def initialize(participant,start_dttm)
    if participant.is_a?(NullParticipant)
      @participant_id = 0
    else
      @participant_id = participant.id
    end
    @start_dttm = start_dttm.to_s
  end

  def call
    ActiveRecord::Base.connection.select_values(sql)
  end

  # participant has receive daily / weekly digest AND
  # (participant has mentions AND has participated in the thread) OR
  # there is a comment on a challenge followed by the participant
  def sql
    %Q[
      SELECT c.id AS id
        FROM comments c,
             email_preferences p
       WHERE c.topic_id IN (SELECT topic_id
                              FROM comments
                             WHERE participant_id = #{@participant_id}
                               AND created_at >= '#{@start_dttm}')
         AND p.participant_id = c.participant_id
         AND p.email_frequency_cd IN ('daily','weekly')
         AND p.mentions IS TRUE
      UNION
      SELECT c.id AS id
        FROM comments c,
             email_preferences p,
             follows f,
             topics t
       WHERE f.participant_id = #{@participant_id}
         AND f.participant_id = p.participant_id
         AND f.followable_type = 'Challenge'
         AND c.topic_id = t.id
         AND t.challenge_id = f.followable_id
         AND c.created_at >= '#{@start_dttm}'
         AND p.email_frequency_cd IN ('daily','weekly')
         AND p.challenges_followed IS TRUE
    ]
  end

end
