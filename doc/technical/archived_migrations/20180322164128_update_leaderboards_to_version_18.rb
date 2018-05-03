class UpdateLeaderboardsToVersion18 < ActiveRecord::Migration[5.0]
  def change
    update_view :leaderboards, version: 18, revert_to_version: 17
  end
end
