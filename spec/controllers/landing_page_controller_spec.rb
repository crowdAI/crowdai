require 'rails_helper'

RSpec.describe LandingPageController, type: :controller do
  render_views

  let!(:challenge_draft) {
    create :challenge,
      :draft,
      challenge: 'challenge_draft' }
  let!(:challenge_running) {
    create :challenge,
      challenge: 'challenge_running' }
  let!(:challenge_completed) {
    create :challenge,
      :completed,
      challenge: 'challenge_completed' }
  let!(:challenge_starting_soon) {
    create :challenge,
      :starting_soon,
      challenge: 'challenge_starting_soon' }
  let!(:participant) { create :participant }
  let!(:admin) { create :participant, admin: true }


  context 'participant' do
    before do
      sign_in participant
    end

    describe 'GET #index challenge_running' do
      before { get :index }
      it { expect(assigns(:challenges).sort).to eq [challenge_running, challenge_completed, challenge_starting_soon].sort }
      it { expect(response).to render_template :index }
    end
  end

  context 'anonymous user' do
    describe 'GET #index challenge_running' do
      before { get :index }
      it { expect(assigns(:challenges).sort).to eq [challenge_running, challenge_completed, challenge_starting_soon].sort }
      it { expect(response).to render_template :index }
    end
  end

  context 'ordering of challenges' do
    # TODO
  end


end
