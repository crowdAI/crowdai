class Cleanup < ActiveRecord::Migration[5.2]
  def change
	  execute "drop table old_leaderboard;"
	  execute "drop table old_ongoing_leaderboards;"
  end
end
