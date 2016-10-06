class RemoveTestFromSubmissionFiles < ActiveRecord::Migration
  def change
    remove_column :submission_files, :test, :string
  end
end
