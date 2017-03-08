class DatasetFileDownload < ApplicationRecord
  belongs_to :participant
  belongs_to :dataset_file

  validates :ip_address,
            presence: true,
            uniqueness: false
  validates :participant_id,      presence: true
  validates :dataset_file_id,     presence: true
end
