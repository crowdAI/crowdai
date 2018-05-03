class UpdateLeaderboardsToVersion22 < ActiveRecord::Migration[5.0]
  def change
    update_view :leaderboards, version: 22, revert_to_version: 21
  end
end
