require 'rails_helper'

RSpec.describe "Timelines", type: :request do
  describe "GET /timelines" do
    it "works! (now write some real specs)" do
      get timelines_path
      expect(response).to have_http_status(200)
    end
  end
end
