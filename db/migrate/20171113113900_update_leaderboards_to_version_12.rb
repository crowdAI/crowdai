class UpdateLeaderboardsToVersion12 < ActiveRecord::Migration[5.0]
  def change
    update_view :leaderboards, version: 12, revert_to_version: 11
  end
end
