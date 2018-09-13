class UpdateParticipantSignUpsToVersion2 < ActiveRecord::Migration[5.2]
  def change
    update_view :participant_sign_ups, version: 2, revert_to_version: 1
  end
end
