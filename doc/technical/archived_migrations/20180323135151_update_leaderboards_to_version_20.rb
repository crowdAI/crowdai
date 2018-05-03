class UpdateLeaderboardsToVersion20 < ActiveRecord::Migration[5.0]
  def change
    update_view :leaderboards, version: 20, revert_to_version: 19
  end
end
