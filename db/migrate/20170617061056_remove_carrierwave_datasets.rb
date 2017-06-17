class RemoveCarrierwaveDatasets < ActiveRecord::Migration[5.0]
  def change
    remove_column :dataset_files, :dataset_file
  end
end
