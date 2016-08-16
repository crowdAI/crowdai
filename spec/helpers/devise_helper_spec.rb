# -*- encoding: utf-8 -*-

require 'rails_helper'

describe DeviseHelper do

  
  describe '#devise_mapping' do
    it 'works' do
      result = devise_mapping
      expect(result).not_to be_nil
    end
  end

  
  describe '#resource_name' do
    it 'works' do
      result = resource_name
      expect(result).not_to be_nil
    end
  end

  
  describe '#resource_class' do
    it 'works' do
      result = resource_class
      expect(result).not_to be_nil
    end
  end

  
  describe '#devise_error_messages!' do
    it 'works' do
      result = devise_error_messages!
      expect(result).not_to be_nil
    end
  end

end
