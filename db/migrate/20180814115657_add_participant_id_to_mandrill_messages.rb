class AddParticipantIdToMandrillMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :mandrill_messages, :participant_id, :integer
  end
end
