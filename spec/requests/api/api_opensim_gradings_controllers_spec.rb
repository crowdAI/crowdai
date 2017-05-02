require 'rails_helper'

RSpec.describe "Api::OpensimGradingsControllers", type: :request do
  describe "GET /api_opensim_gradings_controllers" do
    it "works! (now write some real specs)" do
      get api_opensim_gradings_controllers_path
      expect(response).to have_http_status(200)
    end
  end
end
