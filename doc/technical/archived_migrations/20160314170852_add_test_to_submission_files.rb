class AddTestToSubmissionFiles < ActiveRecord::Migration
  def change
    add_column :submission_files, :test, :string
  end
end
