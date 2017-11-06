class UpdateParticipantChallengeCountsToVersion3 < ActiveRecord::Migration[5.0]
  def change
    update_view :participant_challenge_counts, version: 3, revert_to_version: 2
  end
end
