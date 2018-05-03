class UpdateLeaderboardsToVersion17 < ActiveRecord::Migration[5.0]
  def change
    update_view :leaderboards, version: 17, revert_to_version: 16
  end
end
