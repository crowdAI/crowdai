require 'rails_helper'

RSpec.describe "EmailsControllers", type: :request do
  describe "GET /emails_controllers" do
    it "works! (now write some real specs)" do
      get emails_controllers_path
      expect(response).to have_http_status(200)
    end
  end
end
