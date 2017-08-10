class CommentsDigestQuery

  def initialize(participant_id,start_dttm)
    @participant_id = participant_id
    @start_dttm = start_dttm.to_s
  end

  def call
    ActiveRecord::Base.connection.select_values(sql)
  end

  def sql
    %Q[
      SELECT c.id AS id
        FROM comments c,
             email_preferences p
       WHERE c.topic_id IN (SELECT topic_id
                              FROM comments
                             WHERE id = #{@participant_id}
                               AND created_at >= '#{@start_dttm}')
         AND p.participant_id = c.participant_id
         AND p.mentions IS TRUE
      UNION
      SELECT f.followable_id AS id
        FROM follows f,
             email_preferences p
       WHERE followable_type = 'Challenge'
         AND f.participant_id = p.participant_id
         AND f.followable_id = (SELECT challenge_id
                                  FROM topics
                                 WHERE id IN (SELECT topic_id
                                                FROM comments
                                               WHERE id = #{@participant_id}
                                                 AND created_at >= '#{@start_dttm}'))
         AND p.challenges_followed IS TRUE
    ]
  end

end
