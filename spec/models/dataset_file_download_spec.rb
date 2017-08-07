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

require 'spec_helper'

describe DatasetFileDownload do
  context 'fields' do
    it { is_expected.to respond_to :ip_address }
  end

  context 'associations' do
    it { is_expected.to belong_to(:participant) }
    it { is_expected.to belong_to(:dataset_file) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:participant_id) }
    it { is_expected.to validate_presence_of(:dataset_file_id) }
    it { is_expected.to validate_presence_of(:ip_address) }
  end
end
