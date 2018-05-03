class UpdateCurrentLeaderboardsToVersion3 < ActiveRecord::Migration[5.0]
  def change
    drop_view :leaderboards

    update_view :current_leaderboards, version: 3, revert_to_version: 2

    create_view :leaderboards
  end
end
