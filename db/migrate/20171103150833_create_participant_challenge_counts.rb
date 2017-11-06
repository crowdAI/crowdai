class CreateParticipantChallengeCounts < ActiveRecord::Migration[5.0]
  def change
    create_view :participant_challenge_counts
  end
end
