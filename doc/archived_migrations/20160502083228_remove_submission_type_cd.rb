class RemoveSubmissionTypeCd < ActiveRecord::Migration
  def change
    remove_column :submissions, :submission_type_cd
    
  end
end
