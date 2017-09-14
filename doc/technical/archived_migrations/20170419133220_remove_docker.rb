class RemoveDocker < ActiveRecord::Migration[5.0]
  def change
    remove_column :submissions, :docker_configuration_id
    execute "drop table container_logs;"
    execute "drop table container_instances;"
    execute "drop table docker_files;"
    execute "drop table docker_configurations;"
  end
end
