class AddShowLeaderboardToChallenges < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :show_leaderboard, :boolean, default: true
  end
end
