require 'spec_helper'

describe SubmissionGrade do
  context 'associations' do
    it { should belong_to(:submission) }
  end

  context 'validations' do
    it { should validate_presence_of(:submission_id) }
  end

  context 'methods' do
    describe '#update_submission' do
      it 'works' do
        submission_grade = SubmissionGrade.new
        result = submission_grade.update_submission
        expect(result).not_to be_nil
      end
    end
  end

end
