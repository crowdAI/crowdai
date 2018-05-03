class UpdateCurrentLeaderboardsToVersion2 < ActiveRecord::Migration[5.0]
  def change
    drop_view :leaderboards
    update_view :current_leaderboards, version: 2, revert_to_version: 1
    create_view :leaderboards
  end
end
