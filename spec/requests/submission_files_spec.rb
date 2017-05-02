require 'rails_helper'

RSpec.describe "SubmissionFiles", type: :request do
  describe "GET /submission_files" do
    it "works! (now write some real specs)" do
      get submission_files_path
      expect(response).to have_http_status(200)
    end
  end
end
