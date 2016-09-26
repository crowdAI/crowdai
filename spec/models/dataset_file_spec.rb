require 'rails_helper'

describe DatasetFile do
  context 'associations' do
    it { should belong_to(:challenge) }
    it { should have_many(:dataset_file_downloads) }
  end

  describe "database indexes" do
    it { is_expected.to have_db_index ["challenge_id"] }
  end

  context 'validations' do
    it { should validate_presence_of(:challenge_id) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:dataset_file_s3_key) }
  end
end
