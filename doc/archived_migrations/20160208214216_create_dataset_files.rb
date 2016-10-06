class CreateDatasetFiles < ActiveRecord::Migration
  def change
    create_table :dataset_files do |t|
      t.references :dataset, index: true, foreign_key: true
      t.integer :seq
      t.string :filename
      t.string :filetype

      t.timestamps null: false
    end
  end
end
