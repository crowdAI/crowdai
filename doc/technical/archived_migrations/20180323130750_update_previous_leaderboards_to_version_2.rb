class UpdatePreviousLeaderboardsToVersion2 < ActiveRecord::Migration[5.0]
  def change
    drop_view :leaderboards
    update_view :previous_leaderboards, version: 2, revert_to_version: 1, materialized: true
    create_view :leaderboards

    Scenic.database.refresh_materialized_view(
      :previous_leaderboards,
      concurrently: false,
      cascade: false)
    Scenic.database.refresh_materialized_view(
      :previous_ongoing_leaderboards,
      concurrently: false,
      cascade: false)

  end
end
