require "rails_helper"

RSpec.describe EmailPreferencesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/email_preferences_controllers").to route_to("email_preferences_controllers#index")
    end

    it "routes to #new" do
      expect(:get => "/email_preferences_controllers/new").to route_to("email_preferences_controllers#new")
    end

    it "routes to #show" do
      expect(:get => "/email_preferences_controllers/1").to route_to("email_preferences_controllers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/email_preferences_controllers/1/edit").to route_to("email_preferences_controllers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/email_preferences_controllers").to route_to("email_preferences_controllers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/email_preferences_controllers/1").to route_to("email_preferences_controllers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/email_preferences_controllers/1").to route_to("email_preferences_controllers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/email_preferences_controllers/1").to route_to("email_preferences_controllers#destroy", :id => "1")
    end

  end
end
