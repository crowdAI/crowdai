require 'rails_helper'

describe SubmissionFile do
  context 'associations' do
    it { should belong_to(:submission) }
  end

  context 'indexes' do
    it { should have_db_index ["submission_id"] }
  end
end
