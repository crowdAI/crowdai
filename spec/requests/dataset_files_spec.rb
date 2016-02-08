require 'rails_helper'

RSpec.describe "DatasetFiles", type: :request do
  describe "GET /dataset_files" do
    it "works! (now write some real specs)" do
      get dataset_files_path
      expect(response).to have_http_status(200)
    end
  end
end
