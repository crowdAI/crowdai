class UpdateLeaderboardsToVersion10 < ActiveRecord::Migration[5.0]
  def change
    update_view :leaderboards, version: 10, revert_to_version: 9
  end
end
