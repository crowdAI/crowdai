require "rails_helper"

RSpec.describe CommentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/comments_controllers").to route_to("comments_controllers#index")
    end

    it "routes to #new" do
      expect(:get => "/comments_controllers/new").to route_to("comments_controllers#new")
    end

    it "routes to #show" do
      expect(:get => "/comments_controllers/1").to route_to("comments_controllers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/comments_controllers/1/edit").to route_to("comments_controllers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/comments_controllers").to route_to("comments_controllers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/comments_controllers/1").to route_to("comments_controllers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/comments_controllers/1").to route_to("comments_controllers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/comments_controllers/1").to route_to("comments_controllers#destroy", :id => "1")
    end

  end
end
