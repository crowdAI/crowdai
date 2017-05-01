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
