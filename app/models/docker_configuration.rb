class DockerConfiguration < ActiveRecord::Base
  belongs_to :challenge
  has_many :docker_files, dependent: :destroy

  accepts_nested_attributes_for :docker_files, reject_if: :all_blank, allow_destroy: true
end
