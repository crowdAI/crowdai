require 'rails_helper'

RSpec.describe "OrganizerApplications", type: :request do
  describe "GET /organizer_applications" do
    it "works! (now write some real specs)" do
      get organizer_applications_path
      expect(response).to have_http_status(200)
    end
  end
end
