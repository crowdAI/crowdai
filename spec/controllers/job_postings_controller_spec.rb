require 'rails_helper'

RSpec.describe JobPostingsController, type: :controller do

  describe "GET #index" do
    3.times do
      let(:job_posting) { create :job_posting }
    end
    it "returns a success response" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    let(:job_posting) { create :job_posting }
    it "returns a success response" do
      get :show, params: {id: job_posting.to_param}
      expect(response).to be_success
    end
  end

end
