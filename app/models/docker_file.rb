class DockerFile < ActiveRecord::Base
  belongs_to :docker_configuration
  has_paper_trail
end
