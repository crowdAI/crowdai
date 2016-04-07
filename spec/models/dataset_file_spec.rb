require 'rails_helper'

RSpec.describe DatasetFile, type: :model do
  before do
    @dataset_file = build(:dataset_file)
  end

  describe 'simple model pre-checks' do
    it 'has a valid factory' do
      dataset_file = build(:dataset_file)
      expect(dataset_file).to be_valid
    end

  end

  describe 'fields and associations' do
    subject { @dataset_file }
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :seq }
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
    it { is_expected.to have_db_column :description }
    it { is_expected.to have_db_column :dataset_file_file_name }
    it { is_expected.to have_db_column :dataset_file_content_type }
    it { is_expected.to have_db_column :dataset_file_file_size }
    it { is_expected.to have_db_column :dataset_file_updated_at }
    it { is_expected.to have_db_column :challenge_id }
  end

  describe 'specific validations' do
  end

  # === Relations ===
  it { is_expected.to belong_to :challenge }



  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["challenge_id"] }
end
