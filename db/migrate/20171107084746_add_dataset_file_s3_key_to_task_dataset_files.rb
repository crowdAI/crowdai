class AddDatasetFileS3KeyToTaskDatasetFiles < ActiveRecord::Migration[5.1]
  def change
    add_column :task_dataset_files, :dataset_file_s3_key, :string
  end
end
