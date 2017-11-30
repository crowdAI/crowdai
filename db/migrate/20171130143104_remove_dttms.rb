class RemoveDttms < ActiveRecord::Migration[5.1]
  def change
    remove_column :challenges, :start_dttm
    remove_column :challenges, :end_dttm 
  end
end
