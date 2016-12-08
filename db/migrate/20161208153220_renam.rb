class Renam < ActiveRecord::Migration
  def change
    rename_column :email_preferences, :leaderboard_entry, :my_leaderboard
    rename_column :email_preferences, :new_leader, :any_leaderboard
  end
end
