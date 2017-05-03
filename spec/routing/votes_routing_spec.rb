require "rails_helper"

RSpec.describe VotesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/votes_controllers").to route_to("votes_controllers#index")
    end

    it "routes to #new" do
      expect(:get => "/votes_controllers/new").to route_to("votes_controllers#new")
    end

    it "routes to #show" do
      expect(:get => "/votes_controllers/1").to route_to("votes_controllers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/votes_controllers/1/edit").to route_to("votes_controllers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/votes_controllers").to route_to("votes_controllers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/votes_controllers/1").to route_to("votes_controllers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/votes_controllers/1").to route_to("votes_controllers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/votes_controllers/1").to route_to("votes_controllers#destroy", :id => "1")
    end

  end
end
