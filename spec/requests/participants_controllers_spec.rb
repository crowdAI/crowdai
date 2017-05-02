require 'rails_helper'

RSpec.describe "ParticipantsControllers", type: :request do
  describe "GET /participants_controllers" do
    it "works! (now write some real specs)" do
      get participants_controllers_path
      expect(response).to have_http_status(200)
    end
  end
end
