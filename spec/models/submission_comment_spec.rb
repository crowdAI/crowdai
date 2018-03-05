require 'rails_helper'

describe SubmissionComment do
  context 'associations' do
    it { is_expected.to belong_to(:submission) }
    it { is_expected.to belong_to(:participant) }
    it { is_expected.to have_many(:votes) }
  end

  context 'indexes' do
    it { is_expected.to have_db_index ["submission_id"] }
    it { is_expected.to have_db_index ["participant_id"] }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:vote_count) }
  end
end
