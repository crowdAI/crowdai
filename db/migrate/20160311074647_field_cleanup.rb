class FieldCleanup < ActiveRecord::Migration
  def change
    remove_column :submissions, :ranking
    remove_column :submission_files, :filename
    remove_column :submission_files, :filetype
    remove_column :dataset_files, :filename
    remove_column :dataset_files, :filetype
  end
end
