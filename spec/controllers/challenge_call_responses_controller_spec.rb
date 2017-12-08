require 'rails_helper'

RSpec.describe ChallengeCallResponsesController, type: :controller do
  render_views

  let(:challenge_call) { create :challenge_call }
  let(:challenge_call_response) { create :challenge_call_response }
  let(:valid_attributes) {
    FactoryGirl.attributes_for(:challenge_call_response)
  }

  describe 'GET #show' do
    before { get :show, params: { challenge_call_id: challenge_call_response.challenge_call_id, id: challenge_call_response.id } }
    it { expect(assigns(:challenge_call_response)).to eq challenge_call_response }
    it { expect(response).to render_template :show }
  end

  describe "GET #new" do
    before { get :new, params: { challenge_call_id: challenge_call.id } }
    it { expect(assigns(:challenge_call_response)).to be_a_new(ChallengeCallResponse) }
    it { expect(assigns(:challenge_call_response).challenge_call_id).to eq(challenge_call.id) }
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ChallengeCallResponse" do
        expect {
          post :create, params: { challenge_call_id: challenge_call.id, challenge_call_response: valid_attributes }
        }.to change(ChallengeCallResponse, :count).by(1)
      end

      it "assigns a newly created ChallengeCallResponse as @challenge_call_response" do
        post :create, params: { challenge_call_id: challenge_call.id, challenge_call_response: valid_attributes }
        expect(assigns(:challenge_call_response)).to be_a(ChallengeCallResponse)
        expect(assigns(:challenge_call_response)).to be_persisted
      end

      it "redirects to the created challenge_call_response" do
        post :create, params: { challenge_call_id: challenge_call.id, challenge_call_response: valid_attributes }
        expect(response).to redirect_to(ChallengeCallResponse.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved challenge_call_response as @challenge_call_response" do
        post :create, params: { article: invalid_attributes}
        expect(assigns(:article)).to be_a_new(Article)
      end

      it "re-renders the 'new' template" do
        post :create, params: { article: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end
end
