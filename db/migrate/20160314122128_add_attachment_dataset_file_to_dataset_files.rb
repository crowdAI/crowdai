class AddAttachmentDatasetFileToDatasetFiles < ActiveRecord::Migration
  def self.up
    change_table :dataset_files do |t|
      t.string :description
      t.attachment :dataset_file
    end
  end

  def self.down
    remove_column :dataset_files, :description
    remove_attachment :dataset_files, :dataset_file
  end
end
