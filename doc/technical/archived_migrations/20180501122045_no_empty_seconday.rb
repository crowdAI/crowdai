class NoEmptySeconday < ActiveRecord::Migration[5.1]
  def change
    execute "update challenges set primary_sort_order_cd = 'not_used' where primary_sort_order_cd is null;"
	
  end
end
