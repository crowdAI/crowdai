require 'rails_helper'

describe SubmissionFileDefinition do
  context 'associations' do
    it { should belong_to(:challenge) }
  end

  context 'indexes' do
    it { should have_db_index ["submission_id"] }
  end
end
