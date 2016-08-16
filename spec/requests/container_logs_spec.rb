require 'rails_helper'

RSpec.describe "ContainerLogs", type: :request do
  describe "GET /container_logs" do
    it "works! (now write some real specs)" do
      get container_logs_path
      expect(response).to have_http_status(200)
    end
  end
end
