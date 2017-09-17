class AddDefaultToPrimarySortOrder < ActiveRecord::Migration[5.0]
  def change
    change_column_default :challenges, :primary_sort_order_cd, 'ascending'
    change_column_default :challenges, :grading_factor, 1
  end
end
