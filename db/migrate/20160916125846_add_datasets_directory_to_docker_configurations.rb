class AddDatasetsDirectoryToDockerConfigurations < ActiveRecord::Migration
  def change
    add_column :docker_configurations, :datasets_directory, :string
    remove_column :docker_configurations, :slug
  end
end
