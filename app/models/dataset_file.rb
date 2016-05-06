class DatasetFile < ActiveRecord::Base
  belongs_to :challenge
  has_many :dataset_file_downloads
end
