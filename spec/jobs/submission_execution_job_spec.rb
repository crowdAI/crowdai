# -*- encoding: utf-8 -*-

require 'spec_helper'

describe SubmissionExecutionJob do

  
  describe '#perform' do
    it 'works' do
      submission_execution_job = SubmissionExecutionJob.new
      submission_id = double('submission_id')
      result = submission_execution_job.perform(submission_id)
      expect(result).not_to be_nil
    end
  end

end
