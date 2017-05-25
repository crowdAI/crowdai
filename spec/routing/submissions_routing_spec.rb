require "rails_helper"

RSpec.describe SubmissionsController, type: :routing do
  describe "valid routing with challenge" do
    it "routes to #index" do
      expect(:get => "/challenges/1/submissions").to route_to("submissions#index", challenge_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/challenges/1/submissions/1").to route_to("submissions#show", :id => "1", challenge_id: "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/challenges/1/submissions/1").to route_to("submissions#destroy", :id => "1", challenge_id: "1")
    end

    it "routes to #edit" do
      expect(:get => "/challenges/1/submissions/1/edit").to route_to("submissions#edit", :id => "1", challenge_id: "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/challenges/1/submissions/1").to route_to("submissions#update", :id => "1", challenge_id: "1")
    end

  end

  describe "invalid routing with challenge" do
    it "routes to #new" do
      expect(:get => "/submissions/new").not_to be_routable
    end

    it "routes to #create" do
      expect(:post => "/submissions").not_to be_routable
    end

    it "routes to #update via PUT" do
      expect(:put => "/submissions/1").not_to be_routable
    end
  end


  describe "invalid routing" do
    it "routes to #index" do
      expect(:get => "/submissions").not_to be_routable
    end

    it "routes to #show" do
      expect(:get => "/submissions/1").not_to be_routable
    end

    it "routes to #destroy" do
      expect(:delete => "/submissions/1").not_to be_routable
    end

    it "routes to #edit" do
      expect(:get => "/submissions/1/edit").not_to be_routable
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/submissions/1").not_to be_routable
    end

    it "routes to #new" do
      expect(:get => "/submissions/new").not_to be_routable
    end

    it "routes to #create" do
      expect(:post => "/submissions").not_to be_routable
    end

    it "routes to #update via PUT" do
      expect(:put => "/submissions/1").not_to be_routable
    end

  end
end
