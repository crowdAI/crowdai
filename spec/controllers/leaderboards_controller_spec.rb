require 'rails_helper'
RSpec.describe LeaderboardsController, type: :controller do
  render_views

  context 'current round' do
    3.times do |i|
      let!("submission_#{i + 1}") {
        create :submission,
          challenge: challenge,
          participant: participant }
    end
    let(:challenge) { create :challenge }
    let(:participant) { create :participant }
    let(:user) { create :participant }

    before do
      sign_in user
    end

    describe 'GET #index' do
      before { get :index, params: { challenge_id: submission_1.challenge_id } }
      #it { expect(assigns(:leaderboards).count).to eq(3) }
      it { expect(response).to render_template :index }
    end

=begin
    describe 'GET #show' do
      before { get :show, params: { challenge_id: submission_1.challenge_id, id: submission_1.id } }
      it { expect(assigns(:submission)).to eq submission_1 }
      it { expect(assigns(:entry).id).to eq submission_1.id }
      it { expect(response).to render_template :show }
    end
=end
  end


  context 'post challenge on' do

  end


end
