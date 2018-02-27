class Fixseq < ActiveRecord::Migration[5.1]
  def change
    remove_column :challenge_rounds, :seq
    remove_column :challenge_rounds, :leaderboard_visible
    add_column :challenges, :current_challenge_round_id, :integer
    cr = ChallengeRound.all
    cr.each do |round|
      round.start_dttm = round.start_date.to_datetime + round.start_time.seconds_since_midnight.seconds
      round.end_dttm = round.end_date.to_datetime + round.end_time.seconds_since_midnight.seconds
      round.save
    end
    challenges = Challenge.all
    challenges.each do |c|
      c.update(current_challenge_round_id: c.challenge_rounds.last.id)
    end
  end
end
