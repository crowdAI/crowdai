require "rails_helper"

RSpec.describe ChallengesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/challenges").to route_to("challenges#index")
    end

    it "routes to #new" do
      expect(:get => "/challenges/new").to route_to("challenges#new")
    end

    it "routes to #show" do
      expect(:get => "/challenges/1").to route_to("challenges#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/challenges/1/edit").to route_to("challenges#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/challenges").to route_to("challenges#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/challenges/1").to route_to("challenges#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/challenges/1").to route_to("challenges#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/challenges/1").to route_to("challenges#destroy", :id => "1")
    end

  end
end
