class CreateContainerLogs < ActiveRecord::Migration
  def change
    create_table :container_logs do |t|
      t.references :docker_container, index: true, foreign_key: true
      t.string :log_level_cd
      t.string :message

      t.timestamps null: false
    end
    add_column :docker_containers, :image_id, :string
    add_column :docker_containers, :container_id, :string
  end
end
