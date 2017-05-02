require 'rails_helper'

RSpec.describe "SubmissionsControllers", type: :request do
  describe "GET /submissions_controllers" do
    it "works! (now write some real specs)" do
      get submissions_controllers_path
      expect(response).to have_http_status(200)
    end
  end
end
