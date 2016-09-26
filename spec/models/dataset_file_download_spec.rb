require 'spec_helper'

describe DatasetFileDownload do
  context 'associations' do
    it { should belong_to(:participant) }
    it { should belong_to(:dataset_file) }
  end

  context 'validations' do
    it { should validate_presence_of(:participant_id) }
    it { should validate_presence_of(:dataset_file_id) }
    it { should validate_presence_of(:ip_address) }
  end
end
