class AddEmailFrequencyToEmailPreferences < ActiveRecord::Migration[5.2]
  def change
    add_column :email_preferences, :email_frequency, :string, default: 'daily'
  end
end
