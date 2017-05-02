require 'rails_helper'

RSpec.describe "MailersControllers", type: :request do
  describe "GET /mailers_controllers" do
    it "works! (now write some real specs)" do
      get mailers_controllers_path
      expect(response).to have_http_status(200)
    end
  end
end
