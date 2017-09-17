class Challengedates < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :start_date, :date
    add_column :challenges, :end_date, :date
    add_column :challenges, :start_time, :time
    add_column :challenges, :end_time, :time
  end
end
