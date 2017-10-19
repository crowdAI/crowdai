require "rails_helper"

RSpec.describe LeaderboardsController, type: :routing do
  describe 'valid routing with challenge' do
    it "routes to #index" do
      expect(:get => "/challenges/1/leaderboards").to route_to("leaderboards#index", challenge_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/challenges/1/leaderboards/2").to route_to('leaderboards#show', challenge_id: "1", id: "2")
    end
  end

  describe 'invalid routing with challenge' do

    it "does not route to #new" do
      #expect(:get => "/challenges/1/leaderboards/new").not_to be_routable
    end

    it "does not route to #edit" do
      expect(:get => "/challenges/1/leaderboards/1/edit").not_to be_routable
    end

    it "does not route to #create" do
      expect(:post => "/challenges/1/leaderboards").not_to be_routable
    end

    it "does not route to #update via PUT" do
      expect(:put => "/challenges/1/leaderboards/1").not_to be_routable
    end

    it "does not route to #update via PATCH" do
      expect(:patch => "/challenges/1/leaderboards/1").not_to be_routable
    end

    it "does not route to #destroy" do
      expect(:delete => "/challenges/1/leaderboards/1").not_to be_routable
    end

  end


  describe "invalid routing" do
    it "does not route to #index" do
      expect(:get => "/leaderboards").not_to be_routable
    end

    it "does not route to #new" do
      expect(:get => "/leaderboards/new").not_to be_routable
    end

    it "does not route to #show" do
      expect(:get => "/leaderboards/1").not_to be_routable
    end

    it "does not route to #edit" do
      expect(:get => "/leaderboards/1/edit").not_to be_routable
    end

    it "does not route to #create" do
      expect(:post => "/leaderboards").not_to be_routable
    end

    it "does not route to #update via PUT" do
      expect(:put => "/leaderboards/1").not_to be_routable
    end

    it "does not route to #update via PATCH" do
      expect(:patch => "/leaderboards/1").not_to be_routable
    end

    it "does not route to #destroy" do
      expect(:delete => "/leaderboards/1").not_to be_routable
    end
  end
end
