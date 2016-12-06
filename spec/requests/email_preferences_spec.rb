require 'rails_helper'

RSpec.describe "EmailPreferences", type: :request do
  describe "GET /email_preferences" do
    it "works! (now write some real specs)" do
      get email_preferences_path
      expect(response).to have_http_status(200)
    end
  end
end
