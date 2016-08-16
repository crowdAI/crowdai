# -*- encoding: utf-8 -*-

require 'spec_helper'

describe SqlView do

  
  describe '#included' do
    it 'works' do
      sql_view = SqlView.new
      base = double('base')
      result = sql_view.included(base)
      expect(result).not_to be_nil
    end
  end

end
