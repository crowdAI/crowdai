class AddGradingFields < ActiveRecord::Migration
  def change
    add_column :challenges, :primary_grader_cd, :string
    add_column :challenges, :secondary_grader_cd, :string
    add_column :challenges, :grading_factor, :float
  end
end
