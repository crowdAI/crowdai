require 'spec_helper'

describe SubmissionGrade do
  context 'associations' do
    it { is_expected.to belong_to(:submission) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:submission_id) }
  end

end
