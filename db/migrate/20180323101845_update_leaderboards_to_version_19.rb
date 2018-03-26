class UpdateLeaderboardsToVersion19 < ActiveRecord::Migration[5.0]
  def change
    update_view :leaderboards, version: 19, revert_to_version: 18
  end
end
