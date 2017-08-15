require 'rails_helper'

describe DatasetFile do
  context 'fields' do
    it { is_expected.to respond_to :seq }
    it { is_expected.to respond_to :description }
    it { is_expected.to respond_to :dataset_file_s3_key }
    it { is_expected.to respond_to :evaluation }
  end

  context 'associations' do
    it { is_expected.to belong_to(:challenge) }
    it { is_expected.to have_many(:dataset_file_downloads) }
  end

  describe "database indexes" do
    it { is_expected.to have_db_index ["challenge_id"] }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:description) }
  end
end
