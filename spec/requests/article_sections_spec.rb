require 'rails_helper'

RSpec.describe "ArticleSections", type: :request do
  describe "GET /article_sections" do
    it "works! (now write some real specs)" do
      get article_sections_path
      expect(response).to have_http_status(200)
    end
  end
end
