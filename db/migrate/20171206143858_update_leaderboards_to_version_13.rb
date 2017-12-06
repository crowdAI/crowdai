class UpdateLeaderboardsToVersion13 < ActiveRecord::Migration[5.0]
  def change
    update_view :leaderboards, version: 13, revert_to_version: 12
  end
end
