class ReoveAuto < ActiveRecord::Migration[5.1]
  def change
    remove_column :challenges, :automatic_grading
  end
end
