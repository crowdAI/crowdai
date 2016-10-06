class CreateOngoingLeaderboards < ActiveRecord::Migration
  def change
    execute "drop view ongoing_leaderboards"
    create_view :ongoing_leaderboards
  end
end
