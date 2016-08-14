class RemoveExistingFromDockerConfigurations < ActiveRecord::Migration
  def change
    remove_column :docker_configurations, :existing_mount_point
  end
end
