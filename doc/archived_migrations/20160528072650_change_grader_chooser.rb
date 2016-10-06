class ChangeGraderChooser < ActiveRecord::Migration
  def change
    add_column :challenges, :grader_cd, :string
    remove_column :challenges, :primary_grader_cd
    remove_column :challenges, :secondary_grader_cd
  end
end
