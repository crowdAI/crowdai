# -*- encoding: utf-8 -*-

require 'rails_helper'

describe ImagesHelper do

  
  describe '#image_medium_url' do
    it 'works' do
      result = image_medium_url(challenge)
      expect(result).not_to be_nil
    end
  end

end
