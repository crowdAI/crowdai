class RenameFreq < ActiveRecord::Migration[5.2]
  def change
	  rename_column :email_preferences, :email_frequency, :email_frequency_cd
  end
end
