require 'rails_helper'

RSpec.describe JobPostingsController, type: :controller do
  render_views

  3.times do |i|
    let!("job_posting_#{i + 1}") { create :job_posting }
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: job_posting_1.id }
      expect(response).to render_template(:show)
    end
  end

end
