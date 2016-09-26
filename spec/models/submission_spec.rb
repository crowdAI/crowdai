require 'rails_helper'

describe Submission do
  context 'associations' do
    it { should belong_to(:challenge) }
    it { should belong_to(:submission) }
    it { should have_many(:submission_files).dependent(:destroy) }
    it { should have_many(:submission_grades).dependent(:destroy) }
    it { should accept_nested_attributes_for(:submission_grades) }
    it { should have_many(:votes) }
    it { should have_many(:container_instances) }

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

  context 'indexes' do
    it { should have_db_index ["challenge_id"] }
    it { should have_db_index ["participant_id"] }
  end

  context 'validations' do
    it { should validate_presence_of(:participant_id) }
    it { should validate_presence_of(:challenge_id) }
    it { should validate_presence_of(:grading_status) }
    it { should validate_presence_of(:description_markdown) }
  end

  context 'methods' do
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

    describe '#submitted?' do
      it 'works' do
        submission = Submission.new
        result = submission.submitted?
        expect(result).not_to be_nil
      end
    end


    describe '#graded?' do
      it 'works' do
        submission = Submission.new
        result = submission.graded?
        expect(result).not_to be_nil
      end
    end


    describe '#failed?' do
      it 'works' do
        submission = Submission.new
        result = submission.failed?
        expect(result).not_to be_nil
      end
    end

    describe '#ready?' do
      it 'works' do
        submission = Submission.new
        result = submission.ready?
        expect(result).not_to be_nil
      end
    end
  end

end
