# -*- encoding: utf-8 -*-

require 'spec_helper'

describe ChallengeDashboard do

  
  describe '#display_resource' do
    it 'works' do
      challenge_dashboard = ChallengeDashboard.new
      challenge = double('challenge')
      result = challenge_dashboard.display_resource(challenge)
      expect(result).not_to be_nil
    end
  end

end
