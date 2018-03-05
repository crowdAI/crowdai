require 'rails_helper'

describe SubmissionFile do
  context 'associations' do
    it { is_expected.to belong_to(:submission) }
  end

  context 'indexes' do
    it { is_expected.to have_db_index ["submission_id"] }
  end
end
