class UpdateParticipantChallengesToVersion4 < ActiveRecord::Migration[5.0]
  def change
    update_view :participant_challenges, version: 4, revert_to_version: 3
  end
end
