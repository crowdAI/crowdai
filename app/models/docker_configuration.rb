class DockerConfiguration < ActiveRecord::Base
  has_paper_trail
  belongs_to :challenge
  has_many :docker_files, dependent: :destroy
  has_many :container_instances, dependent: :destroy

  validates :name,    presence: true
  validates :image,   presence: true
end
