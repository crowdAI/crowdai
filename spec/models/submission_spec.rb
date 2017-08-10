# == Schema Information
#
# Table name: submissions
#
#  id                   :integer          not null, primary key
#  challenge_id         :integer
#  participant_id       :integer
#  score                :float
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  description          :text
#  score_secondary      :float
#  grading_message      :string
#  grading_status_cd    :string           default("ready")
#  description_markdown :text
#  vote_count           :integer          default(0)
#  post_challenge       :boolean          default(FALSE)
#  api                  :string
#  media_large          :string
#  media_thumbnail      :string
#  media_content_type   :string
#
# Indexes
#
#  index_submissions_on_challenge_id    (challenge_id)
#  index_submissions_on_participant_id  (participant_id)
#
# Foreign Keys
#
#  fk_rails_...  (challenge_id => challenges.id)
#  fk_rails_...  (participant_id => participants.id)
#

require 'rails_helper'

describe Submission do
  context 'fields' do
    it { is_expected.to respond_to :score }
    it { is_expected.to respond_to :description }
    it { is_expected.to respond_to :score_secondary }
    it { is_expected.to respond_to :score }
    it { is_expected.to respond_to :grading_message }
    it { is_expected.to respond_to :grading_status_cd }
    it { is_expected.to respond_to :description_markdown }
    it { is_expected.to respond_to :vote_count }
    it { is_expected.to respond_to :post_challenge }
  end

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
   end

 end
