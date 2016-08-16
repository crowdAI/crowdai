# -*- encoding: utf-8 -*-

require 'spec_helper'

describe Grader do

  
  describe '#new' do
    it 'works' do
      submission_id = double('submission_id')
      result = Grader.new(submission_id)
      expect(result).not_to be_nil
    end
  end

  
  describe '#grade' do
    it 'works' do
      submission_id = double('submission_id')
      grader = Grader.new(submission_id)
      result = grader.grade
      expect(result).not_to be_nil
    end
  end

  
  describe '#call_grader' do
    it 'works' do
      submission_id = double('submission_id')
      grader = Grader.new(submission_id)
      result = grader.call_grader
      expect(result).not_to be_nil
    end
  end

  
  describe '#evaluate_response' do
    it 'works' do
      submission_id = double('submission_id')
      grader = Grader.new(submission_id)
      submission_id = double('submission_id')
      response = double('response')
      result = grader.evaluate_response(submission_id, response)
      expect(result).not_to be_nil
    end
  end

end
