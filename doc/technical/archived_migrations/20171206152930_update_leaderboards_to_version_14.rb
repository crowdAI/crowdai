class UpdateLeaderboardsToVersion14 < ActiveRecord::Migration[5.0]
  def change
    update_view :leaderboards, version: 14, revert_to_version: 13
  end
end
