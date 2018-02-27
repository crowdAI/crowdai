class CreateParticipantSignUps < ActiveRecord::Migration[5.0]
  def change
    create_view :participant_sign_ups
  end
end
