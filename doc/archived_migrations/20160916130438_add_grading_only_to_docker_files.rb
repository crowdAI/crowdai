class AddGradingOnlyToDockerFiles < ActiveRecord::Migration
  def change
    add_column :docker_files, :grading_only, :boolean, default: false
  end
end
