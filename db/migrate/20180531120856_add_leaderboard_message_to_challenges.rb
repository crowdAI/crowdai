class AddLeaderboardMessageToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :leaderboard_message_markdown, :text
    add_column :challenges, :leaderboard_message, :text
  end
end
