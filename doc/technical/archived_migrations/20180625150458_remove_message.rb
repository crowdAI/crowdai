class RemoveMessage < ActiveRecord::Migration[5.2]
  def change
    remove_column :challenges, :leaderboard_message_markdown
    remove_column :challenges, :leaderboard_message
  end
end
