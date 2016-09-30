# -*- encoding: utf-8 -*-

require 'rails_helper'

describe S3FilesHelper do


  describe '#s3_filesize' do
    it 'works' do
      result = s3_filesize(s3_key)
      expect(result).not_to be_nil
    end
  end


  describe '#s3_expiring_url' do
    it 'works' do
      result = s3_expiring_url(s3_key)
      expect(result).not_to be_nil
    end
  end


  describe '#datasets_url' do
    it 'works' do
      result = datasets_url(s3_key)
      expect(result).not_to be_nil
    end
  end


  describe '#s3_file_info' do
    it 'works' do
      result = s3_file_info(s3_file_obj)
      expect(result).not_to be_nil
    end
  end


  describe '#download_url' do
    it 'works' do
      result = download_url(file)
      expect(result).not_to be_nil
    end
  end

end
