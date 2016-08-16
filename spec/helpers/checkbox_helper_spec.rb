# -*- encoding: utf-8 -*-

require 'rails_helper'

describe CheckboxHelper do

  
  describe '#display_checkbox' do
    it 'works' do
      result = display_checkbox(boolean, label)
      expect(result).not_to be_nil
    end
  end

end
