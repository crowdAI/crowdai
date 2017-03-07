require 'rails_helper'

RSpec.describe "Mailers", type: :request do
  describe "GET /mailers" do
    it "works! (now write some real specs)" do
      get mailers_path
      expect(response).to have_http_status(200)
    end
  end
end
