# -*- encoding: utf-8 -*-

require 'spec_helper'

describe GradeSubmission do

  
  describe '#new' do
    it 'works' do
      configuration_id = double('configuration_id')
      submission_id = double('submission_id')
      result = GradeSubmission.new(configuration_id, submission_id)
      expect(result).not_to be_nil
    end
  end

  
  describe '#grade' do
    it 'works' do
      configuration_id = double('configuration_id')
      submission_id = double('submission_id')
      grade_submission = GradeSubmission.new(configuration_id, submission_id)
      configuration_id = double('configuration_id')
      submission_id = double('submission_id')
      result = grade_submission.grade(configuration_id, submission_id)
      expect(result).not_to be_nil
    end
  end

  
  describe '#callback_script' do
    it 'works' do
      configuration_id = double('configuration_id')
      submission_id = double('submission_id')
      grade_submission = GradeSubmission.new(configuration_id, submission_id)
      id = double('id')
      result = grade_submission.callback_script(id)
      expect(result).not_to be_nil
    end
  end

end
