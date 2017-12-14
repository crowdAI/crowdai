class AddExternalUrlToDatasetFiles < ActiveRecord::Migration[5.1]
  def change
    add_column :dataset_files, :hosting_location, :string
    add_column :dataset_files, :external_url, :string
  end
end
