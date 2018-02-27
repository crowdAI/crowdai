class AddExternalFileSizeToDatasetFiles < ActiveRecord::Migration[5.1]
  def change
    add_column :dataset_files, :external_file_size, :string
  end
end
