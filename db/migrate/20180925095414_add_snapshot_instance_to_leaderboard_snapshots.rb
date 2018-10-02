class AddSnapshotInstanceToLeaderboardSnapshots < ActiveRecord::Migration[5.2]
  def change
    add_column :leaderboard_snapshots, :snapshot_instance, :integer
  end
end
