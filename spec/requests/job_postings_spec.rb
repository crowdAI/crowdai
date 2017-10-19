require 'rails_helper'

RSpec.describe "JobPostings", type: :request do
  describe "GET /job_postings" do
    it "works! (now write some real specs)" do
      get job_postings_path
      expect(response).to have_http_status(200)
    end
  end
end
