class AddTitleToDatasetFiles < ActiveRecord::Migration[5.0]
  def change
    add_column :dataset_files, :title, :string
  end
end
