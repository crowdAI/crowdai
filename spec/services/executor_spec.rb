# -*- encoding: utf-8 -*-

require 'spec_helper'

describe Executor do

  
  describe '#new' do
    it 'works' do
      submission_id = double('submission_id')
      result = Executor.new(submission_id)
      expect(result).not_to be_nil
    end
  end

  
  describe '#execute' do
    it 'works' do
      submission_id = double('submission_id')
      executor = Executor.new(submission_id)
      result = executor.execute
      expect(result).not_to be_nil
    end
  end

  
  describe '#call_executor' do
    it 'works' do
      submission_id = double('submission_id')
      executor = Executor.new(submission_id)
      result = executor.call_executor
      expect(result).not_to be_nil
    end
  end

  
  describe '#evaluate_response' do
    it 'works' do
      submission_id = double('submission_id')
      executor = Executor.new(submission_id)
      submission_id = double('submission_id')
      response = double('response')
      result = executor.evaluate_response(submission_id, response)
      expect(result).not_to be_nil
    end
  end

end
