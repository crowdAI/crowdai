class AddDockerConfigurationIdToSubmissions < ActiveRecord::Migration
  def change
    add_reference :submissions, :docker_configuration, index: true, foreign_key: true
  end
end
