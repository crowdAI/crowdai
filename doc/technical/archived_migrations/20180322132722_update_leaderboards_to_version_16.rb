class UpdateLeaderboardsToVersion16 < ActiveRecord::Migration[5.0]
  def change
    update_view :leaderboards, version: 16, revert_to_version: 15
  end
end
