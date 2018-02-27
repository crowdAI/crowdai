class AddVisibleToDatasetFiles < ActiveRecord::Migration[5.1]
  def change
    add_column :dataset_files, :visible, :boolean, default: true
    execute "update dataset_files set visible = true;"
  end
end
