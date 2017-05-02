require 'rails_helper'

RSpec.describe "CommentsControllers", type: :request do
  describe "GET /comments_controllers" do
    it "works! (now write some real specs)" do
      get comments_controllers_path
      expect(response).to have_http_status(200)
    end
  end
end
