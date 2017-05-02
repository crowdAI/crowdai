require "rails_helper"

RSpec.describe LeaderboardsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/leaderboards_controllers").to route_to("leaderboards_controllers#index")
    end

    it "routes to #new" do
      expect(:get => "/leaderboards_controllers/new").to route_to("leaderboards_controllers#new")
    end

    it "routes to #show" do
      expect(:get => "/leaderboards_controllers/1").to route_to("leaderboards_controllers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/leaderboards_controllers/1/edit").to route_to("leaderboards_controllers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/leaderboards_controllers").to route_to("leaderboards_controllers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/leaderboards_controllers/1").to route_to("leaderboards_controllers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/leaderboards_controllers/1").to route_to("leaderboards_controllers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/leaderboards_controllers/1").to route_to("leaderboards_controllers#destroy", :id => "1")
    end

  end
end
