class AddS3FilenameToDatasetFiles < ActiveRecord::Migration
  def change
    add_column :dataset_files, :s3_filename, :string
  end
end
