require "rails_helper"

RSpec.describe LandingPageController, type: :routing do
  describe "valid routing" do
    it "routes to #index" do
      expect(:get => "/landing_page").to route_to("landing_page#index")
    end
  end

  describe 'invalid routing' do
    it "routes to #new" do
      expect(:get => "/landing_page/new").not_to be_routable
    end

    it "routes to #show" do
      expect(:get => "/landing_page/1").not_to be_routable
    end

    it "routes to #edit" do
      expect(:get => "/landing_page/1/edit").not_to be_routable
    end

    it "routes to #create" do
      expect(:post => "/landing_page").not_to be_routable
    end

    it "routes to #update via PUT" do
      expect(:put => "/landing_page/1").not_to be_routable
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/landing_page/1").not_to be_routable
    end

    it "routes to #destroy" do
      expect(:delete => "/landing_page/1").not_to be_routable
    end

  end
end
