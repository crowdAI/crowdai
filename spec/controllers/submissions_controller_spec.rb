require 'rails_helper'

RSpec.describe SubmissionsController, type: :controller do
  render_views

  3.times do |i|
    let!("submission_#{i + 1}") {
      create :submission,
        challenge: challenge,
        participant: participant }
  end
  let(:challenge) { create :challenge }
  let(:participant) { create :participant }

  before do
    sign_in participant
  end

  describe 'GET #index' do
    before { get :index, params: { challenge_id: submission_1.challenge_id } }
    it { expect(assigns(:submissions).sort).to eq [submission_1, submission_2, submission_3].sort }
    it { expect(response).to render_template :index }
  end

  describe 'GET #show' do
    before { get :show, params: { challenge_id: submission_1.challenge_id, id: submission_1.id } }
    it { expect(assigns(:submission)).to eq submission_1 }
    it { expect(response).to render_template :show }
  end

end
