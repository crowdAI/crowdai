require 'rails_helper'

RSpec.describe "OrganizersControllers", type: :request do
  describe "GET /organizers_controllers" do
    it "works! (now write some real specs)" do
      get organizers_controllers_path
      expect(response).to have_http_status(200)
    end
  end
end
