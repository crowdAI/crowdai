class AddLeaderboardVisibleToStages < ActiveRecord::Migration[5.1]
  def change
    add_column :stages, :leaderboard_visible, :boolean, default: false
  end
end
