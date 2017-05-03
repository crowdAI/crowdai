require "rails_helper"

RSpec.describe EmailsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/emails_controllers").to route_to("emails_controllers#index")
    end

    it "routes to #new" do
      expect(:get => "/emails_controllers/new").to route_to("emails_controllers#new")
    end

    it "routes to #show" do
      expect(:get => "/emails_controllers/1").to route_to("emails_controllers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/emails_controllers/1/edit").to route_to("emails_controllers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/emails_controllers").to route_to("emails_controllers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/emails_controllers/1").to route_to("emails_controllers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/emails_controllers/1").to route_to("emails_controllers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/emails_controllers/1").to route_to("emails_controllers#destroy", :id => "1")
    end

  end
end
