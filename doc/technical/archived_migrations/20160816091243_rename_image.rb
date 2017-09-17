class RenameImage < ActiveRecord::Migration
  def change
    rename_column :docker_configurations, :container, :image
    rename_column :container_instances, :image_id, :image_sha
    rename_column :container_instances, :container_id, :container_sha
    add_column :container_logs, :log_source_cd, :string
  end
end
