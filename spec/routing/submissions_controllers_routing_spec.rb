require "rails_helper"

RSpec.describe SubmissionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/submissions_controllers").to route_to("submissions_controllers#index")
    end

    it "routes to #new" do
      expect(:get => "/submissions_controllers/new").to route_to("submissions_controllers#new")
    end

    it "routes to #show" do
      expect(:get => "/submissions_controllers/1").to route_to("submissions_controllers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/submissions_controllers/1/edit").to route_to("submissions_controllers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/submissions_controllers").to route_to("submissions_controllers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/submissions_controllers/1").to route_to("submissions_controllers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/submissions_controllers/1").to route_to("submissions_controllers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/submissions_controllers/1").to route_to("submissions_controllers#destroy", :id => "1")
    end

  end
end
