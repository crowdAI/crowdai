require 'rails_helper'

RSpec.describe ChallengesController, type: :controller do

  let!(:challenge_draft) { create :challenge, :draft, challenge: 'challenge_draft' }
  let!(:challenge_running) { create :challenge, :running, challenge: 'challenge_running' }
  let!(:challenge_completed) { create :challenge, :completed, challenge: 'challenge_completed' }
  let!(:challenge_starting_soon) { create :challenge, :starting_soon, challenge: 'challenge_starting_soon' }
  let!(:participant) { create :participant }

  context 'participant' do
    before do
      sign_in participant
    end

    describe 'GET #index challenge_running' do
      before { get :index }
      it { expect((assigns(:challenges).map(&:challenge)).sort).to eq ['challenge_running', 'challenge_completed', 'challenge_starting_soon'].sort }
      it { expect(response).to render_template :index }
    end

    context '@challenge_list filtering' do
      describe 'GET #index "All"' do
        describe 'GET #index challenge_running' do
          before { get :index, { challenge_filter: 'all' } }
          it { expect((assigns(:challenge_list).map(&:challenge)).sort).to eq ['challenge_running', 'challenge_completed', 'challenge_starting_soon'].sort }
          it { expect(response).to render_template :index }
        end
      end

      describe 'GET #index "Active"' do
        describe 'GET #index challenge_running' do
          before { get :index, { challenge_filter: 'active' } }
          it { expect((assigns(:challenge_list).map(&:challenge)).sort).to eq ['challenge_running'].sort }
          it { expect(response).to render_template :index }
        end
      end

      describe 'GET #index "Completed"' do
        describe 'GET #index challenge_running' do
          before { get :index, challenge_filter: 'completed' }
          it { expect((assigns(:challenge_list).map(&:challenge)).sort).to eq ['challenge_completed'].sort }
          it { expect(response).to render_template :index }
        end
      end
    end

    describe 'GET #show challenge_completed' do
      before { get :show, id: challenge_completed.id }
      it { expect(assigns(:challenge)).to eq challenge_completed }
      it { expect(response).to render_template :show }
    end

    describe 'GET #show challenge_starting_soon' do
      before { get :show, id: challenge_starting_soon.id }
      it { expect(assigns(:challenge)).to eq challenge_starting_soon }
      it { expect(response).to render_template :show }
    end

    describe 'GET #show challenge_draft' do
      before { get :show, id: challenge_draft.id }
      it { denies_access }
    end
  end

  context 'anonymous user' do
    describe 'GET #index challenge_running' do
      before { get :index }
      it { expect((assigns(:challenges).map(&:challenge)).sort).to eq ['challenge_running', 'challenge_completed', 'challenge_starting_soon'].sort }
      it { expect(response).to render_template :index }
    end

    describe 'GET #show challenge_completed' do
      before { get :show, id: challenge_completed.id }
      it { expect(assigns(:challenge)).to eq challenge_completed }
      it { expect(response).to render_template :show }
    end

    describe 'GET #show challenge_starting_soon' do
      before { get :show, id: challenge_starting_soon.id }
      it { expect(assigns(:challenge)).to eq challenge_starting_soon }
      it { expect(response).to render_template :show }
    end

    describe 'GET #show challenge_draft' do
      before { get :show, id: challenge_draft.id }
      it { denies_access }
    end
  end

end
