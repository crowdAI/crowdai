require "rails_helper"

RSpec.describe LandingPageController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/landing_page_controllers").to route_to("landing_page_controllers#index")
    end

    it "routes to #new" do
      expect(:get => "/landing_page_controllers/new").to route_to("landing_page_controllers#new")
    end

    it "routes to #show" do
      expect(:get => "/landing_page_controllers/1").to route_to("landing_page_controllers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/landing_page_controllers/1/edit").to route_to("landing_page_controllers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/landing_page_controllers").to route_to("landing_page_controllers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/landing_page_controllers/1").to route_to("landing_page_controllers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/landing_page_controllers/1").to route_to("landing_page_controllers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/landing_page_controllers/1").to route_to("landing_page_controllers#destroy", :id => "1")
    end

  end
end
