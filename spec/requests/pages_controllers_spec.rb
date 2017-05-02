require 'rails_helper'

RSpec.describe "PagesControllers", type: :request do
  describe "GET /pages_controllers" do
    it "works! (now write some real specs)" do
      get pages_controllers_path
      expect(response).to have_http_status(200)
    end
  end
end
