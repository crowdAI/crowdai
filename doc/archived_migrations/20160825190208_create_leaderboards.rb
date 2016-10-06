class CreateLeaderboards < ActiveRecord::Migration
  def change
    execute "drop view leaderboards"
    create_view :leaderboards
  end
end
