class DropEventLogger < ActiveRecord::Migration[5.2]
  def change
	  execute "drop table event_logs;"
  end
end
