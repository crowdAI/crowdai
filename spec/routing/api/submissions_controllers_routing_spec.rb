require "rails_helper"

RSpec.describe Api::SubmissionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/submissions_controllers").to route_to("api/submissions_controllers#index")
    end

    it "routes to #new" do
      expect(:get => "/api/submissions_controllers/new").to route_to("api/submissions_controllers#new")
    end

    it "routes to #show" do
      expect(:get => "/api/submissions_controllers/1").to route_to("api/submissions_controllers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/api/submissions_controllers/1/edit").to route_to("api/submissions_controllers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/api/submissions_controllers").to route_to("api/submissions_controllers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/submissions_controllers/1").to route_to("api/submissions_controllers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/submissions_controllers/1").to route_to("api/submissions_controllers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/submissions_controllers/1").to route_to("api/submissions_controllers#destroy", :id => "1")
    end

  end
end
