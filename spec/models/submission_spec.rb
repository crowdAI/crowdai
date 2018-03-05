require 'rails_helper'

describe Submission do
  context 'associations' do
    it { is_expected.to belong_to(:challenge) }
    it { is_expected.to have_many(:submission_files).dependent(:destroy) }
    it { is_expected.to have_many(:submission_grades).dependent(:destroy) }
    it { is_expected.to have_many(:votes) }

    it 'is ordered by seq when seq 0 is created first' do
      submission = create(:submission)
      create(:submission_file, submission: submission, seq: 1)
      create(:submission_file, submission: submission, seq: 0)
      submission.reload
      expect(submission.submission_files.first.seq).to eq(0)
      expect(submission.submission_files.last.seq).to eq(1)
    end

    it 'is ordered by seq when seq 0 is created second' do
      submission = create(:submission)
      create(:submission_file, submission: submission, seq: 0)
      create(:submission_file, submission: submission, seq: 1)
      submission.reload
      expect(submission.submission_files.first.seq).to eq(0)
      expect(submission.submission_files.last.seq).to eq(1)
    end
  end

  context 'indexes' do
    it { is_expected.to have_db_index ["challenge_id"] }
    it { is_expected.to have_db_index ["participant_id"] }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:participant_id) }
    it { is_expected.to validate_presence_of(:challenge_id) }
    it { is_expected.to validate_presence_of(:grading_status) }
  end

  context 'methods' do
     describe 'post_challenge flag' do
       context 'no events are assigned' do
         let(:submission) { create(:submission) }
         it { expect(submission.post_challenge).to be false }
       end

       context 'submission is made during the challenge' do
         let(:challenge) { create(:challenge, :running)}
         let(:submission) { create(:submission, challenge: challenge) }
         it { expect(submission.post_challenge).to be false }
       end

     end

     describe '#submitted?' do
       it 'works' do
         submission = create(:submission, grading_status: :submitted)
         expect(submission.submitted?).to be true
       end
     end


     describe '#graded?' do
       it 'works' do
         submission = create(:submission, grading_status: :graded)
         expect(submission.graded?).to be true
       end
     end


     describe '#failed?' do
       it 'works' do
         submission = create(:submission, grading_status: :failed)
         expect(submission.failed?).to be true
       end
     end

     describe '#ready?' do
       it 'works' do
         submission = create(:submission, grading_status: :ready)
         expect(submission.ready?).to be true
       end
     end

     describe '#short_url' do
       it 'works' do
         submission = create(:submission)
         expect(submission.short_url).not_to be_nil
       end
     end
   end

 end
