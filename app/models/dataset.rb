class Dataset < ActiveRecord::Base
  belongs_to :competition
  has_many :dataset_files
  accepts_nested_attributes_for :dataset_files, reject_if: :all_blank, allow_destroy: true

  has_many :file_attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :file_attachments, allow_destroy: true
end
