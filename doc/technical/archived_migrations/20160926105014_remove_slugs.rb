class RemoveSlugs < ActiveRecord::Migration
  def change
    remove_column :container_instances, :slug
    remove_column :container_logs, :slug
    remove_column :dataset_file_downloads, :slug
    remove_column :dataset_files, :slug
    remove_column :events, :slug

  end
end
