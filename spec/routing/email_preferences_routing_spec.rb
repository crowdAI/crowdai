require "rails_helper"

RSpec.describe EmailPreferencesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/email_preferences").to route_to("email_preferences#index")
    end

    it "routes to #new" do
      expect(:get => "/email_preferences/new").to route_to("email_preferences#new")
    end

    it "routes to #show" do
      expect(:get => "/email_preferences/1").to route_to("email_preferences#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/email_preferences/1/edit").to route_to("email_preferences#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/email_preferences").to route_to("email_preferences#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/email_preferences/1").to route_to("email_preferences#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/email_preferences/1").to route_to("email_preferences#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/email_preferences/1").to route_to("email_preferences#destroy", :id => "1")
    end

  end
end
