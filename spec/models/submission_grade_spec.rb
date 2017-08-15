require 'spec_helper'

describe SubmissionGrade do
  context 'fields' do
    it { is_expected.to respond_to :grading_status_cd }
    it { is_expected.to respond_to :grading_factor }
    it { is_expected.to respond_to :score }
    it { is_expected.to respond_to :score_secondary }
  end

  context 'associations' do
    it { is_expected.to belong_to(:submission) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:submission_id) }
  end

end
