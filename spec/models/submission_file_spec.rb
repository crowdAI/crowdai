require 'rails_helper'

RSpec.describe SubmissionFile, type: :model do
  before do
    @submission_file = build(:submission_file)
  end

  describe 'simple model pre-checks' do

  end

  describe 'fields and associations' do
    subject { @submission_file }

  end

  describe 'specific validations' do
  end

  # === Relations ===
  it { is_expected.to belong_to :submission }



  # === Nested Attributes ===


  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :submission_id }
  it { is_expected.to have_db_column :seq }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :submission_file_file_name }
  it { is_expected.to have_db_column :submission_file_content_type }
  it { is_expected.to have_db_column :submission_file_file_size }
  it { is_expected.to have_db_column :submission_file_updated_at }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["submission_id"] }
end
