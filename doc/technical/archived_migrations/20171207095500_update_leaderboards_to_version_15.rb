class UpdateLeaderboardsToVersion15 < ActiveRecord::Migration[5.0]
  def change
    update_view :leaderboards, version: 15, revert_to_version: 14
  end
end
