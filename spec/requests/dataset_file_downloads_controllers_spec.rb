require 'rails_helper'

RSpec.describe "DatasetFileDownloadsControllers", type: :request do
  describe "GET /dataset_file_downloads_controllers" do
    it "works! (now write some real specs)" do
      get dataset_file_downloads_controllers_path
      expect(response).to have_http_status(200)
    end
  end
end
