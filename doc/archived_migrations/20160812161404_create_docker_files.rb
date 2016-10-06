class CreateDockerFiles < ActiveRecord::Migration
  def change
    create_table :docker_files do |t|
      t.references :docker_configuration, index: true, foreign_key: true
      t.string :configuration_file_s3_key
      t.string :directory

      t.timestamps null: false
    end
  end
end
