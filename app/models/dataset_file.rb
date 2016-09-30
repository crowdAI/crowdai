class DatasetFile < ActiveRecord::Base
  has_paper_trail
  belongs_to :challenge
  has_many :dataset_file_downloads

  validates :challenge_id,          presence: true
  validates :description,           presence: true
  #validates :dataset_file_s3_key,   presence: true
end
