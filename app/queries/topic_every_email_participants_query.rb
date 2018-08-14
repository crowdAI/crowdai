class TopicEveryEmailParticipantsQuery

  def initialize(topic_id)
    @topic_id = topic_id
  end

  def call
    ActiveRecord::Base.connection.select_values(sql)
  end

  # participant has 'receive every email' AND
  # participant follows the challenge which has the comment
  def sql
    %Q[
      SELECT p.participant_id AS id
        FROM email_preferences p,
             follows f,
             topics t
       WHERE t.id = #{@topic_id}
         AND f.participant_id = p.participant_id
         AND f.followable_type = 'Challenge'
         AND t.challenge_id = f.followable_id
         AND p.challenges_followed IS TRUE
         AND p.email_frequency_cd = 'every'
         AND t.participant_id <> p.participant_id
    ]
  end

end
