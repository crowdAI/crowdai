class Fk < ActiveRecord::Migration[5.1]
  def change
	  rename_column :emails, :mailer_id, :crowdai_mailer_id
  end
end
