class AddVideoOnLeaderboardToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :video_on_leaderboard, :boolean, default: false
  end
end
