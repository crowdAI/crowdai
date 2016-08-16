# -*- encoding: utf-8 -*-

require 'rails_helper'

describe SubmissionFilesHelper do

  
  describe '#sub_file_info' do
    it 'works' do
      result = sub_file_info(file)
      expect(result).not_to be_nil
    end
  end

end
