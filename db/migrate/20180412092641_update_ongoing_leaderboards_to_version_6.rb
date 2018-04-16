class UpdateOngoingLeaderboardsToVersion6 < ActiveRecord::Migration[5.0]
  def change
    update_view :ongoing_leaderboards, version: 6, revert_to_version: 5
  end
end
