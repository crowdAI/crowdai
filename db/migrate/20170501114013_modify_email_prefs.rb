class ModifyEmailPrefs < ActiveRecord::Migration[5.0]
  def change
    add_column :email_preferences, :challenges_followed, :boolean, default: true
    add_column :email_preferences, :mentions, :boolean, default: true
    add_column :email_preferences, :receive_every_email, :boolean, default: false
    add_column :email_preferences, :receive_daily_digest, :boolean, default: true
    add_column :email_preferences, :receive_weekly_digest, :boolean, default: false
  end
end
