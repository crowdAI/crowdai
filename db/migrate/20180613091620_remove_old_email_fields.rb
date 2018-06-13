class RemoveOldEmailFields < ActiveRecord::Migration[5.2]
  def change
	  remove_column :email_preferences, :receive_every_email
	  remove_column :email_preferences, :receive_daily_digest
	  remove_column :email_preferences, :receive_weekly_digest
  end
end
