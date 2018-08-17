class DropAuth < ActiveRecord::Migration[5.1]
  def change
    drop_table :login_activities
  end
end
