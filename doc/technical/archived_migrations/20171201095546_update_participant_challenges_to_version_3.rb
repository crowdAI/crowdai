class UpdateParticipantChallengesToVersion3 < ActiveRecord::Migration[5.0]
  def change
    drop_table :challenge_registrations
    create_view :challenge_registrations
    update_view :participant_challenges, version: 3, revert_to_version: 2
  end
end
