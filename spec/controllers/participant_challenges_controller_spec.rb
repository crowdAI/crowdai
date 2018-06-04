require 'rails_helper'

RSpec.describe ParticipantChallengesController, type: :controller do
  render_views

  let!(:challenge) { create :challenge, :running }
  let!(:participant) { create :participant }
  let!(:admin) { create :participant, :admin }
  let!(:submission) {
    create :submission,
    participant: participant,
    challenge: challenge,
    challenge_round_id: challenge.challenge_rounds.first.id }

  before do
    sign_in(admin)
  end

  describe 'GET #index challenge_running' do
    before { get :index, params: { challenge_id: challenge.id } }
      #it { expect(assigns(:challenges).sort).to eq [challenge_running, challenge_completed, challenge_starting_soon].sort }
    it { expect(response).to render_template :index }
  end
end
