class AddOverwritableToDockerFiles < ActiveRecord::Migration
  def change
    add_column :docker_files, :overwritable, :boolean, default: false
    remove_column :docker_files, :slug
  end
end
