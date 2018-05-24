require 'rails_helper'

RSpec.describe GdprExportsController, type: :controller do
  include ActiveJob::TestHelper
  render_views

  let(:participant) { create :participant }

  context 'unauthenticated' do
    it "asks to sign in" do
      post :create, xhr: true
      expect(response).to have_http_status(401)
      expect(ActiveJob::Base.queue_adapter.enqueued_jobs.count).to eq(0)
    end
  end

  context 'authenticated' do
    before do
      sign_in participant
    end
    it "queues the job" do
      post :create, xhr: true
      expect(response).to have_http_status(:success)
      expect(ActiveJob::Base.queue_adapter.enqueued_jobs.count).to eq(1)
    end
  end

end
