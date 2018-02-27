class AddAddressToParticipants < ActiveRecord::Migration[5.1]
  def change
    add_column :participants, :address, :text
  end
end
