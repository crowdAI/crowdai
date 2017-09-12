class AddS3KeyToDatasetFiles < ActiveRecord::Migration
  def change
    add_column :dataset_files, :dataset_file_s3_key, :string
    remove_column :dataset_files, :s3_filename
    remove_column :dataset_files, :dataset_file_file_name
    remove_column :dataset_files, :dataset_file_content_type
    remove_column :dataset_files, :dataset_file_file_size
    remove_column :dataset_files, :dataset_file_updated_at
  end
end
