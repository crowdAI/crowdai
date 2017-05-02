require 'rails_helper'

RSpec.describe "TopicsControllers", type: :request do
  describe "GET /topics_controllers" do
    it "works! (now write some real specs)" do
      get topics_controllers_path
      expect(response).to have_http_status(200)
    end
  end
end
