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

end
