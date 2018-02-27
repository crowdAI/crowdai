class ApplyRound < ActiveRecord::Migration[5.1]
  def change
    challenges = Challenge.all
    challenges.each do |c|
      challenge_round = c.challenge_rounds.first
      execute "update submissions set challenge_round_id = #{challenge_round.id} where challenge_id = #{c.id};"
    end
  end
end
