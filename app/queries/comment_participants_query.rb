class CommentParticipantsQuery

  def initialize(comment_id)
    @comment_id = comment_id
  end

  def call
    ActiveRecord::Base.connection.select_values(sql)
  end

  def sql
    %Q[
      SELECT p.participant_id AS id
        FROM comments c,
             email_preferences p
       WHERE c.topic_id IN (SELECT topic_id
                              FROM comments
                            WHERE id = #{@comment_id})
         AND p.participant_id = c.participant_id
         AND p.mentions IS TRUE
      UNION
      SELECT f.participant_id AS id
        FROM follows f,
             email_preferences p
        WHERE followable_type = 'Challenge'
          AND f.participant_id = p.participant_id
          AND f.followable_id = (SELECT challenge_id
                                   FROM topics
                                  WHERE id IN (SELECT topic_id
                                                 FROM comments
                                                WHERE id = #{@comment_id}))
          AND p.challenges_followed IS TRUE
    ]
  end

end
