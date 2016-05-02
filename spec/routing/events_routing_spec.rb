

require "rails_helper"

RSpec.describe EventsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/challenges/1/events").to route_to("events#index", challenge_id: "1")
    end

    it "routes to #new" do
      expect(:get => "/challenges/1/events/new").to route_to("events#new", challenge_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/challenges/1/events/1").to route_to("events#show", challenge_id: "1", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/challenges/1/events/1/edit").to route_to("events#edit", challenge_id: "1", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/challenges/1/events").to route_to("events#create", challenge_id: "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/challenges/1/events/1").to route_to("events#update", challenge_id: "1", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/challenges/1/events/1").to route_to("events#update", challenge_id: "1", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/challenges/1/events/1").to route_to("events#destroy", challenge_id: "1", :id => "1")
    end

  end
end
