class AddDatasets < ActiveRecord::Migration
  def change
    remove_column :dataset_files, :dataset_id
    add_reference :dataset_files, :competition, index: true
  end
end
