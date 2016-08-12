class DockerConfiguration < ActiveRecord::Base
  belongs_to :challenge
  has_many :docker_files
end
