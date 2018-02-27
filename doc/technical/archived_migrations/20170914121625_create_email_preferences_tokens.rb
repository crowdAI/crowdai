class CreateEmailPreferencesTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :email_preferences_tokens do |t|
      t.references :participant
      t.string :email_preferences_token
      t.datetime :token_expiration_dttm

      t.timestamps
    end
  end
end
