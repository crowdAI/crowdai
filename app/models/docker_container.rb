class ContainerInstance < ActiveRecord::Base
  belongs_to :docker_configuration
  has_many :container_logs, dependent: :destroy
end
