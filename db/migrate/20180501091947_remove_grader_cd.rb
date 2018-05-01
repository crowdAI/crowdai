class RemoveGraderCd < ActiveRecord::Migration[5.1]
  def change
    remove_column :challenges, :grader_cd
  end
end
