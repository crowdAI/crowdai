require 'rails_helper'

RSpec.describe "TaskDatasetFileDownloads", type: :request do
  describe "GET /task_dataset_file_downloads" do
    it "works! (now write some real specs)" do
      get task_dataset_file_downloads_path
      expect(response).to have_http_status(200)
    end
  end
end
