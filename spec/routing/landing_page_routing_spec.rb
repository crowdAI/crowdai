require "rails_helper"

RSpec.describe LandingPageController, type: :routing do
  describe "valid routing" do
    it "routes to #index" do
      expect(:get => "/landing_page").to route_to("landing_page#index")
    end
  end
end
