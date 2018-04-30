class Partner < ApplicationRecord
  belongs_to :organizer, optional: true
  mount_uploader :image_file, RawImageUploader
end
