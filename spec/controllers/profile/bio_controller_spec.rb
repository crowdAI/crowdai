require 'rails_helper'

RSpec.describe Profile::BioController, type: :controller do

  let!(:participant) { create :participant }

  describe "GET #index" do
    before do
      get :index, params: { participant_id: participant.id }
    end
    it { expect(response).to have_http_status(:success) }
  end
end
