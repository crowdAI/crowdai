require 'rails_helper'

RSpec.describe Profile::AchievementsController, type: :controller do

  let!(:participant) { create :participant }
  let!(:badge) { Merit::Badge.find(1) }

  before do
    participant.add_badge(badge.id)
  end

  describe "GET #index" do
    before do
      get :index, params: { id: participant.id }
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(assigns(:achievements).count).to eq(1) }
    #it { expect(assigns(:unachieved).count).to eq(Merit::Badge.all.count - 1) }
  end

end
