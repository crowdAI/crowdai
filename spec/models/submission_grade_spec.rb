require 'spec_helper'

describe SubmissionGrade do
  context 'associations' do
    it { should belong_to(:submission) }
  end

  context 'validations' do
    it { should validate_presence_of(:submission_id) }
  end

end
