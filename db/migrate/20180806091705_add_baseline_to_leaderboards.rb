class AddBaselineToLeaderboards < ActiveRecord::Migration[5.2]
  def change
    drop_view :leaderboards
    drop_view :ongoing_leaderboards
    drop_view :previous_leaderboards
    drop_view :previous_ongoing_leaderboards

    add_column :base_leaderboards, :seq, :integer
    add_column :base_leaderboards, :baseline, :boolean
    add_column :base_leaderboards, :baseline_comment, :string

    create_view :leaderboards, version: 22
    create_view :ongoing_leaderboards, version: 6
    create_view :previous_leaderboards, version: 4
    create_view :previous_ongoing_leaderboards, version: 3
  end
end
