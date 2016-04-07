require 'rails_helper'

RSpec.describe DatasetFile, type: :model do
  before do
    @dataset_file = build(:dataset)
  end

  describe 'simple model pre-checks' do

  end

  describe 'fields and associations' do
    subject { @dataset_file }

  end

  describe 'specific validations' do
  end

  # === Relations ===
  it { is_expected.to belong_to :challenge }



  # === Nested Attributes ===


  # === Database (Columns) ===
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

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["challenge_id"] }
end
