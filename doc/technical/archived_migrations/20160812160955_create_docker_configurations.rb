class CreateDockerConfigurations < ActiveRecord::Migration
  def change
    create_table :docker_configurations do |t|
      t.references :challenge, index: true, foreign_key: true
      t.string :container
      t.string :mount_point
      t.boolean :existing_mount_point
      t.boolean :destroy_after_success
      t.string :execute_command

      t.timestamps null: false
    end
  end
end
