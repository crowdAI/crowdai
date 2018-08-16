class Recalc < ActiveRecord::Migration[5.2]
  def change
    ChallengeRound.all.each do |c|
      CalculateLeaderboardService.new(
        challenge_round_id: c.id).call
    end
  end
end
