class CalculateLeaderboardJob < ApplicationJob
  queue_as :default

  def perform(challenge_round_id:)
    CalculateLeaderboardService
      .new(challenge_round_id: challenge_round_id).call
  end

end
