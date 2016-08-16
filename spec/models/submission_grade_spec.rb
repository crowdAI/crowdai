# -*- encoding: utf-8 -*-

require 'spec_helper'

describe SubmissionGrade do

  
  describe '#update_submission' do
    it 'works' do
      submission_grade = SubmissionGrade.new
      result = submission_grade.update_submission
      expect(result).not_to be_nil
    end
  end

end
