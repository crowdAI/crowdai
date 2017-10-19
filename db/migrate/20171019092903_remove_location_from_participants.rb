class RemoveLocationFromParticipants < ActiveRecord::Migration[5.1]
  def change
    remove_column :participants, :location, :string
  end
end
