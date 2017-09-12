class AddExecuteOnSubmissionToDockerConfigurations < ActiveRecord::Migration
  def change
    add_column :docker_configurations, :execute_on_submission, :boolean, default: false
  end
end
