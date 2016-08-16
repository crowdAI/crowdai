# -*- encoding: utf-8 -*-

require 'spec_helper'

describe OrganizerDashboard do

  
  describe '#display_resource' do
    it 'works' do
      organizer_dashboard = OrganizerDashboard.new
      organizer = double('organizer')
      result = organizer_dashboard.display_resource(organizer)
      expect(result).not_to be_nil
    end
  end

end
