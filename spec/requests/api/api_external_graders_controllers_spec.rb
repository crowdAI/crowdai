require 'rails_helper'

RSpec.describe "Api::ExternalGradersControllers", type: :request do
  describe "GET /api_external_graders_controllers" do
    it "works! (now write some real specs)" do
      get api_external_graders_controllers_path
      expect(response).to have_http_status(200)
    end
  end
end
