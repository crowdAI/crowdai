require 'rails_helper'

RSpec.describe "EmailPreferencesControllers", type: :request do
  describe "GET /email_preferences_controllers" do
    it "works! (now write some real specs)" do
      get email_preferences_controllers_path
      expect(response).to have_http_status(200)
    end
  end
end
