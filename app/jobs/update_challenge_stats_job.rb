class UpdateChallengeStatsJob
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { hourly }

  def perform
    sql = %Q[
      UPDATE challenges AS cup
         SET submission_count = stats.submission_count,
             participant_count = stats.participant_count
      FROM (
      SELECT c.id AS challenge_id,
             COUNT(s.*) AS submission_count,
             COUNT(pc.*) AS participant_count
      FROM challenges c
           LEFT JOIN submissions s
                  ON s.challenge_id = c.id
           LEFT JOIN participant_challenges pc
                  ON pc.challenge_id = c.id
      GROUP BY c.id ) AS stats
      WHERE stats.challenge_id = cup.id
    ]
    result = ActiveRecord::Base.connection.execute(sql)
    logger.info("challenge stats updated, rowcount: #{result.cmd_tuples()}")
  end

end
