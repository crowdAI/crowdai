class CleanupFields < ActiveRecord::Migration[5.0]
  def change
    remove_column :email_preferences, :opt_out_all
    remove_column :email_preferences, :my_leaderboard
    remove_column :email_preferences, :any_post
    remove_column :email_preferences, :my_topic_post
  end
end
