require 'rails_helper'

RSpec.describe Submission, type: :model do

  subject { build(:submission) }

  it { should respond_to(:score) }
  it { should respond_to(:challenge) }
  it { should respond_to(:participant) }
  it { should respond_to(:submission_files) }

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


  describe 'submission_files assocations' do
    it 'is ordered by seq when seq 0 is created first' do
      s = create(:submission)
      create(:submission_file, submission: s, seq: 1)
      create(:submission_file, submission: s, seq: 0)
      expect(s.submission_files.first.seq).to eq(0)
      expect(s.submission_files.last.seq).to eq(1)
    end

    it 'is ordered by seq when seq 0 is created second' do
      s = create(:submission)
      create(:submission_file, submission: s, seq: 0)
      create(:submission_file, submission: s, seq: 1)
      expect(s.submission_files.first.seq).to eq(0)
      expect(s.submission_files.last.seq).to eq(1)
    end
  end

#http://jakegoulding.com/presentations/rspec-structure/#slide-35

  describe 'post_challenge flag' do
    context 'no events are assigned' do
      let(:submission) { create(:submission) }
      it { expect(submission.post_challenge).to be false }
    end

    context 'events are assigned and before start of challenge' do
      let(:submission) { create(:submission) }
      it { expect(submission.post_challenge).to be false }
    end

    context 'events are assigned and after end of challenge' do
      let(:submission) { create(:submission) }
      it { expect(submission.post_challenge).to be true }
    end
  end

end
