require 'rails_helper'

RSpec.describe Submission, type: :model do
  before do
    @submission = build(:submission)
  end

  describe 'simple model pre-checks' do

    it "should allow valid values" do
      %w(participant team).each do |v|
        should allow_value(v).for(:submission_type)
      end
    end
    it { should_not allow_value("other").for(:submission_type) }
  end

  describe 'fields' do
    subject { @submission }

    it { should respond_to(:evaluated) }
    it { should respond_to(:score) }
    it { should respond_to(:ranking) }
    it { should respond_to(:submission_type) }
    it { should respond_to(:withdrawn) }
    it { should respond_to(:withdrawn_date) }
  end

  describe 'associations' do
    subject { @submission }

    it { should respond_to(:challenge) }
    it { should respond_to(:participant) }
    it { should respond_to(:team) }
    it { should respond_to(:submission_files) }
  end

  describe 'specific validations' do
  end

  # === Relations ===
  it { is_expected.to belong_to :challenge }
  it { is_expected.to belong_to :participant }
  it { is_expected.to belong_to :team }

  it { is_expected.to have_many :submission_files }

  # === Nested Attributes ===
  it { is_expected.to accept_nested_attributes_for :submission_files }

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :challenge_id }
  it { is_expected.to have_db_column :participant_id }
  it { is_expected.to have_db_column :team_id }
  it { is_expected.to have_db_column :evaluated }
  it { is_expected.to have_db_column :score }
  it { is_expected.to have_db_column :submission_type_cd }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :description }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["challenge_id"] }
  it { is_expected.to have_db_index ["team_id"] }
  it { is_expected.to have_db_index ["participant_id"] }

  # === Validations (Length) ===


  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :submission_type }
end
