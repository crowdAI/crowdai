require 'rails_helper'

RSpec.describe "DatasetFilesControllers", type: :request do
  describe "GET /dataset_files_controllers" do
    it "works! (now write some real specs)" do
      get dataset_files_controllers_path
      expect(response).to have_http_status(200)
    end
  end
end
