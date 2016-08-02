require 'rails_helper'

RSpec.describe Submission, type: :model do
  before do
    @submission = build(:submission)
  end

  describe 'fields' do
    subject { @submission }
    it { should respond_to(:score) }
  end

  describe 'associations' do
    subject { @submission }

    it { should respond_to(:challenge) }
    it { should respond_to(:participant) }
    it { should respond_to(:submission_files) }
  end

  describe 'submission_files assocations' do
    it 'is ordered by seq' do
      s = create(:submission)
      create(:submission_file, submission: submission)
      expect(submission_file).to be_valid
    end
  end

  # === Relations ===
  it { is_expected.to belong_to :challenge }
  it { is_expected.to belong_to :participant }

  it { is_expected.to have_many :submission_files }

  # === Nested Attributes ===
  it { is_expected.to accept_nested_attributes_for :submission_files }

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :challenge_id }
  it { is_expected.to have_db_column :participant_id }
  it { is_expected.to have_db_column :score }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :description }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["challenge_id"] }
  it { is_expected.to have_db_index ["participant_id"] }


end
