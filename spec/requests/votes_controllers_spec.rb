require 'rails_helper'

RSpec.describe "VotesControllers", type: :request do
  describe "GET /votes_controllers" do
    it "works! (now write some real specs)" do
      get votes_controllers_path
      expect(response).to have_http_status(200)
    end
  end
end
