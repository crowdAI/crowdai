class AddLocationToParticipants < ActiveRecord::Migration[5.0]
  def change
    add_column :participants, :location, :string
    remove_column :participants, :country
    remove_column :participants, :city
  end
end
