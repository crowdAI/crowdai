require 'rails_helper'

RSpec.describe SubmissionGraderJob, type: :job do
  pending "add some examples to (or delete) #{__FILE__}"

  
  describe '#perform' do
    it 'works' do
      submission_grader_job = SubmissionGraderJob.new
      submission_id = double('submission_id')
      result = submission_grader_job.perform(submission_id)
      expect(result).not_to be_nil
    end
  end


end
