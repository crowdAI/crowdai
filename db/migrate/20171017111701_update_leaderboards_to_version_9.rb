class UpdateLeaderboardsToVersion9 < ActiveRecord::Migration[5.0]
  def change
    update_view :leaderboards, version: 9, revert_to_version: 8
  end
end
