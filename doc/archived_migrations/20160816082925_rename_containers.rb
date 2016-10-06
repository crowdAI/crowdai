class RenameContainers < ActiveRecord::Migration
  def change
    rename_table :docker_containers, :container_instances
    rename_column :container_logs, :docker_container_id, :container_instance_id
  end
end
