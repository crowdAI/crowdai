require 'rails_helper'

RSpec.describe "LeaderboardsControllers", type: :request do
  describe "GET /leaderboards_controllers" do
    it "works! (now write some real specs)" do
      get leaderboards_controllers_path
      expect(response).to have_http_status(200)
    end
  end
end
