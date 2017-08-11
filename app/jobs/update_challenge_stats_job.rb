class UpdateChallengeStatsJob < ApplicationJob
  queue_as :default

  def perform
    update_submissions
    update_participants
  end

  def update_submissions
    sql = %Q[
      UPDATE challenges AS C
      SET submission_count =
          (SELECT COUNT(*)
             FROM submissions s
            WHERE s.challenge_id = c.id)
      ]
    result = ActiveRecord::Base.connection.execute(sql)
    logger.info("challenge submissions updated rowcount: #{result.cmd_tuples()}")
  end


  def update_participants
    sql = %Q[
      UPDATE challenges AS C
      SET participant_count =
          (SELECT count(*)
             FROM participant_challenges pc
            WHERE pc.challenge_id = c.id)
      ]
    result = ActiveRecord::Base.connection.execute(sql)
    logger.info("challenge participants updated, rowcount: #{result.cmd_tuples()}")
  end

end
