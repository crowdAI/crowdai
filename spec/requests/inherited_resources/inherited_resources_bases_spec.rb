require 'rails_helper'

RSpec.describe "InheritedResources::Bases", type: :request do
  describe "GET /inherited_resources_bases" do
    it "works! (now write some real specs)" do
      get inherited_resources_bases_path
      expect(response).to have_http_status(200)
    end
  end
end
