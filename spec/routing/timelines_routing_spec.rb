

require "rails_helper"

RSpec.describe TimelinesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/challenges/1/timelines").to route_to("timelines#index", challenge_id: "1")
    end

    it "routes to #new" do
      expect(:get => "/challenges/1/timelines/new").to route_to("timelines#new", challenge_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/challenges/1/timelines/1").to route_to("timelines#show", challenge_id: "1", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/challenges/1/timelines/1/edit").to route_to("timelines#edit", challenge_id: "1", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/challenges/1/timelines").to route_to("timelines#create", challenge_id: "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/challenges/1/timelines/1").to route_to("timelines#update", challenge_id: "1", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/challenges/1/timelines/1").to route_to("timelines#update", challenge_id: "1", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/challenges/1/timelines/1").to route_to("timelines#destroy", challenge_id: "1", :id => "1")
    end

  end
end
