# -*- encoding: utf-8 -*-

require 'spec_helper'

describe SqsSubmissionGraderJob do

  
  describe '#perform' do
    it 'works' do
      sqs_submission_grader_job = SqsSubmissionGraderJob.new
      *args = double('*args')
      result = sqs_submission_grader_job.perform(*args)
      expect(result).not_to be_nil
    end
  end

  
  describe '#queue_url' do
    it 'works' do
      sqs_submission_grader_job = SqsSubmissionGraderJob.new
      sqs = double('sqs')
      result = sqs_submission_grader_job.queue_url(sqs)
      expect(result).not_to be_nil
    end
  end

  
  describe '#send_message' do
    it 'works' do
      sqs_submission_grader_job = SqsSubmissionGraderJob.new
      sqs = double('sqs')
      queue_url = double('queue_url')
      sqs_message = double('sqs_message')
      result = sqs_submission_grader_job.send_message(sqs, queue_url, sqs_message)
      expect(result).not_to be_nil
    end
  end

  
  describe '#sqs_message' do
    it 'works' do
      sqs_submission_grader_job = SqsSubmissionGraderJob.new
      submission_id = double('submission_id')
      result = sqs_submission_grader_job.sqs_message(submission_id)
      expect(result).not_to be_nil
    end
  end

end
