class Fixdatas < ActiveRecord::Migration[5.1]
  def change
    challenges = Challenge.all
    challenges.each do |c|
      c.challenge_rounds.create!(start_date: c.start_date, end_date: c.end_date, start_time: c.start_time, end_time: c.end_time, active: true, leaderboard_visible: true)
    end
  end
end
