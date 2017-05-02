require "rails_helper"

RSpec.describe SubmissionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/submissions").to route_to("submissions#index")
    end

    it "routes to #new" do
      expect(:get => "/submissions/new").to route_to("submissions#new")
    end

    it "routes to #show" do
      expect(:get => "/submissions/1").to route_to("submissions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/submissions/1/edit").to route_to("submissions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/submissions").to route_to("submissions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/submissions/1").to route_to("submissions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/submissions/1").to route_to("submissions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/submissions/1").to route_to("submissions#destroy", :id => "1")
    end

  end
end
