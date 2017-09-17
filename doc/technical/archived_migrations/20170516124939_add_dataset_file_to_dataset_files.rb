class AddDatasetFileToDatasetFiles < ActiveRecord::Migration[5.0]
  def change
    add_column :dataset_files, :dataset_file, :string
  end
end
