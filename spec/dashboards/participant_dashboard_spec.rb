# -*- encoding: utf-8 -*-

require 'spec_helper'

describe ParticipantDashboard do

  
  describe '#display_resource' do
    it 'works' do
      participant_dashboard = ParticipantDashboard.new
      participant = double('participant')
      result = participant_dashboard.display_resource(participant)
      expect(result).not_to be_nil
    end
  end

end
