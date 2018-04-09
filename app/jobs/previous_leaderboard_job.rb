class PreviousLeaderboardJob < ApplicationJob
  queue_as :default

  def perform(challenge_id: )
    PreviousLeaderboardService.new(challenge_id: challenge_id).call
  end

end
