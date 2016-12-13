class Xxx < ActiveRecord::Migration
  def change
    add_column :emails, :participant_id, :integer
  end
end
