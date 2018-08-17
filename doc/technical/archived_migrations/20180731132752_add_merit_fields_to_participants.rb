class AddMeritFieldsToParticipants < ActiveRecord::Migration[5.2]
  def change
    add_column :participants, :sash_id, :integer
    add_column :participants, :level,   :integer, :default => 0
  end
end
