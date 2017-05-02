require 'rails_helper'

RSpec.describe "ChallengesControllers", type: :request do
  describe "GET /challenges_controllers" do
    it "works! (now write some real specs)" do
      get challenges_controllers_path
      expect(response).to have_http_status(200)
    end
  end
end
