class UpdateParticipantChallengesToVersion5 < ActiveRecord::Migration[5.0]
  def change
    update_view :participant_challenges, version: 5, revert_to_version: 4
  end
end
