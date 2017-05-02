require "rails_helper"

RSpec.describe Api::OpensimGradingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/opensim_gradings_controllers").to route_to("api/opensim_gradings_controllers#index")
    end

    it "routes to #new" do
      expect(:get => "/api/opensim_gradings_controllers/new").to route_to("api/opensim_gradings_controllers#new")
    end

    it "routes to #show" do
      expect(:get => "/api/opensim_gradings_controllers/1").to route_to("api/opensim_gradings_controllers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/api/opensim_gradings_controllers/1/edit").to route_to("api/opensim_gradings_controllers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/api/opensim_gradings_controllers").to route_to("api/opensim_gradings_controllers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/opensim_gradings_controllers/1").to route_to("api/opensim_gradings_controllers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/opensim_gradings_controllers/1").to route_to("api/opensim_gradings_controllers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/opensim_gradings_controllers/1").to route_to("api/opensim_gradings_controllers#destroy", :id => "1")
    end

  end
end
