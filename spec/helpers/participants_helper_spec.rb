# -*- encoding: utf-8 -*-

require 'rails_helper'

describe ParticipantsHelper do

  
  describe '#avatar_medium_url' do
    it 'works' do
      result = avatar_medium_url(participant)
      expect(result).not_to be_nil
    end
  end

  
  describe '#avatar_url' do
    it 'works' do
      result = avatar_url(participant, size)
      expect(result).not_to be_nil
    end
  end

end
