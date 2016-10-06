class AddNameToDockerConfigurations < ActiveRecord::Migration
  def change
    add_column :docker_configurations, :name, :string
  end
end
