class DatasetFile < ActiveRecord::Base
  belongs_to :competition
  
  has_attached_file :dataset_file
  validates_attachment :dataset_file, presence: true, content_type: { content_type: ["text/csv","text/plain"] }
end
