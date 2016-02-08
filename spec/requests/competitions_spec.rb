require 'rails_helper'

RSpec.describe "Competitions", type: :request do
  describe "GET /competitions" do
    it "works! (now write some real specs)" do
      get competitions_path
      expect(response).to have_http_status(200)
    end
  end
end
