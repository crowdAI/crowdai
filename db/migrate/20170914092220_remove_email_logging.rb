class RemoveEmailLogging < ActiveRecord::Migration[5.1]
  def change
    drop_table :email_transitions
    drop_table :emails
    drop_table :crowdai_mailers 
  end
end
