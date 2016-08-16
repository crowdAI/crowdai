# -*- encoding: utf-8 -*-

require 'spec_helper'

describe DatasetFileDashboard do

  
  describe '#display_resource' do
    it 'works' do
      dataset_file_dashboard = DatasetFileDashboard.new
      dataset_file = double('dataset_file')
      result = dataset_file_dashboard.display_resource(dataset_file)
      expect(result).not_to be_nil
    end
  end

end
