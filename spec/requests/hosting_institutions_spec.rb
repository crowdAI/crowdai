require 'rails_helper'

RSpec.describe "HostingInstitutions", type: :request do
  describe "GET /hosting_institutions" do
    it "works! (now write some real specs)" do
      get hosting_institutions_path
      expect(response).to have_http_status(200)
    end
  end
end
