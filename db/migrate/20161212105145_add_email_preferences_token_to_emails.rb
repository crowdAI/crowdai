class AddEmailPreferencesTokenToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :email_preferences_token, :string
    add_column :emails, :token_expiration_dttm, :datetime
  end
end
