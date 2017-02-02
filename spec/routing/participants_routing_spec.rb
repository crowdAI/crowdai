require "rails_helper"

RSpec.describe ParticipantsController, type: :routing do
  describe "routing" do
    it 'routes to regen key' do
      expect(get: "/participants/sean/regen_api_key").to route_to(controller: 'participants', action: 'regen_api_key', participant_id: 'sean')
      expect(get: "/participants/1/regen_api_key").to route_to(controller: 'participants', action: 'regen_api_key', participant_id: '1')
    end
  end
end
