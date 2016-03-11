class FileAttachment < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true

  has_attached_file :attachment
  validates_attachment :attachment, presence: true, content_type: { content_type: ["text/csv","application/pdf","text/plain"] }
end
