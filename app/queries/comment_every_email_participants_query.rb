class CommentEveryEmailParticipantsQuery

  def initialize(comment_id)
    @comment_id = comment_id
  end

  def call
    ActiveRecord::Base.connection.select_values(sql)
  end

  # participant has 'receive every email' AND
  # (participant made a comment on one of the comments in the thread OR
  #  participant follows the challenge which has the comment)
  def sql
    %Q[
      SELECT p.participant_id AS id
        FROM comments c,
             email_preferences p,
             topics t
       WHERE c.topic_id = t.id
         AND p.participant_id = c.participant_id
         AND p.mentions IS TRUE
         AND p.email_frequency_cd = 'every'
         AND t.id IN (SELECT c1.topic_id
                        FROM comments c1
                       WHERE c1.id = #{@comment_id})
      UNION
      SELECT p.participant_id AS id
        FROM comments c,
             email_preferences p,
             follows f,
             topics t
       WHERE c.id = #{@comment_id}
         AND f.participant_id = p.participant_id
         AND f.followable_type = 'Challenge'
         AND t.challenge_id = f.followable_id
         AND c.topic_id = t.id
         AND p.challenges_followed IS TRUE
         AND p.email_frequency_cd = 'every'
    ]
  end

end
