class RemoveDateFields < ActiveRecord::Migration
  def change
	remove_column :competitions, :start_date
 	remove_column :competitions, :end_date
  end
end
