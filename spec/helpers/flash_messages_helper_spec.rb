# -*- encoding: utf-8 -*-

require 'rails_helper'

describe FlashMessagesHelper do

  
  describe '#bootstrap_class_for' do
    it 'works' do
      result = bootstrap_class_for(flash_type)
      expect(result).not_to be_nil
    end
  end

end
