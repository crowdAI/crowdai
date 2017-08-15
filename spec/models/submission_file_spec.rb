require 'rails_helper'

describe SubmissionFile do
  context 'fields' do
    it { is_expected.to respond_to(:seq) }
    it { is_expected.to respond_to(:submission_file_s3_key) }
    it { is_expected.to respond_to(:leaderboard_video) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:submission) }
  end

  context 'indexes' do
    it { is_expected.to have_db_index ["submission_id"] }
  end
end
