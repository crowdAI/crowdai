require 'rails_helper'

RSpec.describe SubmissionsController, type: :controller do
  render_views

  3.times do |i|
    let!("submission_#{i + 1}") {
      create :submission,
        challenge: challenge,
        participant: participant,
        grading_status_cd: 'graded' }
  end
  let!(:meta) {
    create :submission,
    :with_meta,
    challenge: challenge,
    participant: participant,
    grading_status_cd: 'graded' }
  let(:challenge) {
    create :challenge,
    :running,
    submissions_page: true }
  let(:participant) { create :participant }

  before do
    sign_in participant
  end

  describe 'GET #index' do
    before { get :index, params: { challenge_id: challenge.id } }
    it { expect(assigns(:submissions).sort).to eq [submission_1, submission_2, submission_3, meta].sort }
    it { expect(response).to render_template :index }
  end

  describe 'GET #show' do
    context do
      before { get :show, params: { challenge_id: challenge.id, id: submission_1.id } }
      it { expect(assigns(:submission)).to eq submission_1 }
      it { expect(response).to render_template :show }
    end
    context 'renders with meta' do
      before { get :show, params: { challenge_id: meta.challenge_id, id: meta.id } }
      it { expect(assigns(:submission)).to eq meta }
      it { expect(response).to render_template :show }
    end
  end

end
