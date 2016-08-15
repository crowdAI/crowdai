class DockerContainer < ActiveRecord::Base
  belongs_to :docker_configuration
  has_many :container_logs
end
