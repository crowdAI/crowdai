class DockerFile < ActiveRecord::Base
  has_paper_trail
  belongs_to :docker_configuration

  validates :configuration_file_s3_key,   presence: true
  validates :directory,                   presence: true
end
