class UpdateLeaderboardsToVersion11 < ActiveRecord::Migration[5.0]
  def change
    update_view :leaderboards, version: 11, revert_to_version: 10
  end
end
