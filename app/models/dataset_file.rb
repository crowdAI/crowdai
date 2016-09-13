class DatasetFile < ActiveRecord::Base
  has_paper_trail
  belongs_to :challenge
  has_many :dataset_file_downloads
end
