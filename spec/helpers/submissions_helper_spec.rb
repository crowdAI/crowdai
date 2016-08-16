# -*- encoding: utf-8 -*-

require 'rails_helper'

describe SubmissionsHelper do

  
  describe '#score' do
    it 'works' do
      result = score(submission)
      expect(result).not_to be_nil
    end
  end

end
