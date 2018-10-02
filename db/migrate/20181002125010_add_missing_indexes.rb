class AddMissingIndexes < ActiveRecord::Migration[5.2]
  def change
        add_index :merit_activity_logs, :action_id
        add_index :participants, :sash_id
  end
end
