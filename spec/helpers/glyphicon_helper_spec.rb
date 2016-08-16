# -*- encoding: utf-8 -*-

require 'rails_helper'

describe GlyphiconHelper do

  
  describe '#glyphicon_link' do
    it 'works' do
      result = glyphicon_link(glyphicon_name, link_name, url_options, html_options, &block)
      expect(result).not_to be_nil
    end
  end

  
  describe '#glyphicon_icon_tag' do
    it 'works' do
      result = glyphicon_icon_tag(glyphicon_name)
      expect(result).not_to be_nil
    end
  end

end
