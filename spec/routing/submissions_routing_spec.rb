
require "rails_helper"

RSpec.describe SubmissionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/challenges/1/submissions").to route_to("submissions#index", challenge_id: "1")
    end

    it "routes to #new" do
      expect(:get => "/challenges/1/submissions/new").to route_to("submissions#new", challenge_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/challenges/1/submissions/1").to route_to("submissions#show", challenge_id: "1", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/challenges/1/submissions/1/edit").to route_to("submissions#edit", challenge_id: "1", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/challenges/1/submissions").to route_to("submissions#create", challenge_id: "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/challenges/1/submissions/1").to route_to("submissions#update", challenge_id: "1", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/challenges/1/submissions/1").to route_to("submissions#update", challenge_id: "1", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/challenges/1/submissions/1").to route_to("submissions#destroy", challenge_id: "1", :id => "1")
    end

  end
end
