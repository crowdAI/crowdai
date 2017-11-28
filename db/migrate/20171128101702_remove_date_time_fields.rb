class RemoveDateTimeFields < ActiveRecord::Migration[5.1]
  def change
    drop_view :challenge_round_summaries
    drop_view :challenge_round_views
    remove_column :challenges, :start_date
    remove_column :challenges, :end_date
    remove_column :challenges, :start_time
    remove_column :challenges, :end_time
    remove_column :challenge_rounds, :start_date
    remove_column :challenge_rounds, :end_date
    remove_column :challenge_rounds, :start_time
    remove_column :challenge_rounds, :end_time
    replace_view :challenge_round_views, version: 2, revert_to_version: 1
    replace_view :challenge_round_summaries, version: 3, revert_to_version: 2
  end
end
