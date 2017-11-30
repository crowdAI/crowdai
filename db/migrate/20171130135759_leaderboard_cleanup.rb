class LeaderboardCleanup < ActiveRecord::Migration[5.1]
  def change
    remove_column :email_preferences, :any_leaderboard
  end
end
