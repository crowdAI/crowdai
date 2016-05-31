class RenameSortFields < ActiveRecord::Migration
  def change
    rename_column :challenges, :score_sort_cd, :primary_sort_order_cd
    rename_column :challenges, :score_secondary_sort_cd, :secondary_sort_order_cd    
  end
end
