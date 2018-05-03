class UpdateLeaderboards < ActiveRecord::Migration[5.1]
  def change
    rename_table :lboards, :base_leaderboards
    drop_view :leaderboards
    drop_view :current_leaderboards
    drop_view :ongoing_leaderboards
    drop_view :current_ongoing_leaderboards
    execute "DROP MATERIALIZED VIEW previous_leaderboards;"
    execute "DROP MATERIALIZED VIEW previous_ongoing_leaderboards;"
    execute "create view leaderboards as select * from challenges where id < 1;"
    execute "create view ongoing_leaderboards as select * from challenges where id < 1;"
    execute "create view previous_leaderboards as select * from challenges where id < 1;"
    execute "create view previous_ongoing_leaderboards as select * from challenges where id < 1;"
    update_view :leaderboards, version: 21, revert_to_version: 20
    update_view :ongoing_leaderboards, version: 5, revert_to_version: 4
    update_view :previous_leaderboards, version: 3, revert_to_version: 2
    update_view :previous_ongoing_leaderboards, version: 2, revert_to_version: 1
  end
end
