# == Schema Information
#
# Table name: dataset_file_downloads
#
#  id              :integer          not null, primary key
#  participant_id  :integer
#  dataset_file_id :integer
#  ip_address      :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_dataset_file_downloads_on_dataset_file_id  (dataset_file_id)
#  index_dataset_file_downloads_on_participant_id   (participant_id)
#
# Foreign Keys
#
#  fk_rails_...  (dataset_file_id => dataset_files.id)
#  fk_rails_...  (participant_id => participants.id)
#

class DatasetFileDownload < ApplicationRecord
  belongs_to :participant, optional: true
  belongs_to :dataset_file

  validates :ip_address,
            presence: true,
            uniqueness: false
  validates :participant_id,      presence: true
  validates :dataset_file_id,     presence: true
end
