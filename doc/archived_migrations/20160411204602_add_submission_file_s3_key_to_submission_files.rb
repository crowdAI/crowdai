class AddSubmissionFileS3KeyToSubmissionFiles < ActiveRecord::Migration
  def change
    add_column :submission_files, :submission_file_s3_key, :string
  end
end
