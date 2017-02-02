require "rails_helper"

RSpec.describe OrganizersController, type: :routing do
  describe "routing" do
    it 'routes to regen key' do
      expect(get: "/organizers/example/regen_api_key").to route_to(controller: 'organizers', action: 'regen_api_key', organizer_id: 'example')
      expect(get: "/organizers/1/regen_api_key").to route_to(controller: 'organizers', action: 'regen_api_key', organizer_id: '1')
    end
  end
end
