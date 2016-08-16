# -*- encoding: utf-8 -*-

require 'spec_helper'

describe SubmissionDashboard do

  
  describe '#display_resource' do
    it 'works' do
      submission_dashboard = SubmissionDashboard.new
      submission = double('submission')
      result = submission_dashboard.display_resource(submission)
      expect(result).not_to be_nil
    end
  end

end
