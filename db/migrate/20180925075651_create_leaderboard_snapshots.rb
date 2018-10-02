class CreateLeaderboardSnapshots < ActiveRecord::Migration[5.2]
  def change
	  execute "create table leaderboard_snapshots as select * from base_leaderboards where id < 1;"
  end
end
