require "rails_helper"

RSpec.describe ErrorsController, type: :routing do
  describe "routing" do
    it 'routes to the errors page on a bad route' do
      expect(get: "/bad_route/1/sean").to route_to(controller: 'errors', action: "e404", path: 'bad_route/1/sean')
    end
  end
end
