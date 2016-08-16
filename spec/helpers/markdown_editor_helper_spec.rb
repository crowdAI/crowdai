# -*- encoding: utf-8 -*-

require 'rails_helper'

describe MarkdownEditorHelper do

  
  describe '#markdown' do
    it 'works' do
      result = markdown(text)
      expect(result).not_to be_nil
    end
  end

end
