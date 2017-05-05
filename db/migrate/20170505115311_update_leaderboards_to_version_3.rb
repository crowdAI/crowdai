class UpdateLeaderboardsToVersion3 < ActiveRecord::Migration
  def change
    update_view :leaderboards, version: 3, revert_to_version: 2
  end
end
