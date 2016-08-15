class CreateDockerContainers < ActiveRecord::Migration
  def change
    create_table :docker_containers do |t|
      t.references :docker_configuration, index: true, foreign_key: true
      t.string :status_cd
      t.string :message

      t.timestamps null: false
    end
  end
end
