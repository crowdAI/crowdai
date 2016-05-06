require 'rails_helper'

RSpec.describe ChallengesController, type: :controller do

  let(:valid_attributes) {
    FactoryGirl.build(:challenge, :with_events).attributes
  }

  let(:invalid_attributes) {
    FactoryGirl.build(:challenge, organizer_id: nil).attributes
  }

  let(:valid_session) { {} }

  before(:each) do
    double_sign_in
  end

  describe "GET #index" do
    it "assigns all challenges as @challenges" do
      challenge = Challenge.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:challenges)).to eq([challenge])
    end
  end

  describe "GET #show" do
    it "assigns the requested challenge as @challenge" do
      challenge = Challenge.create! valid_attributes
      get :show, {:id => challenge.to_param}, valid_session
      expect(assigns(:challenge)).to eq(challenge)
    end
  end

  describe "GET #new" do
    it "assigns a new challenge as @challenge" do
      get :new, {}, valid_session
      expect(assigns(:challenge)).to be_a_new(Challenge)
    end
  end

  describe "GET #edit" do
    it "assigns the requested challenge as @challenge" do
      challenge = Challenge.create! valid_attributes
      get :edit, {:id => challenge.to_param}, valid_session
      expect(assigns(:challenge)).to eq(challenge)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Challenge" do
        expect {
          post :create, {:challenge => valid_attributes}, valid_session
        }.to change(Challenge, :count).by(1)
      end

      it "assigns a newly created challenge as @challenge" do
        post :create, {:challenge => valid_attributes}, valid_session
        expect(assigns(:challenge)).to be_a(Challenge)
        expect(assigns(:challenge)).to be_persisted
      end

      it "redirects to the created challenge" do
        post :create, {:challenge => valid_attributes}, valid_session
        expect(response).to redirect_to(Challenge.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved challenge as @challenge" do
        post :create, {:challenge => invalid_attributes}, valid_session
        expect(assigns(:challenge)).to be_a_new(Challenge)
      end

      it "re-renders the 'new' template" do
        post :create, {:challenge => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {description: "changed description", evaluation: 'changed evaluation'}
      }

      it "updates the requested challenge" do
        challenge = Challenge.create! valid_attributes
        put :update, {:id => challenge.to_param, :challenge => new_attributes}, valid_session
        challenge.reload
        new_attributes.each_pair do |key, value|
          expect(challenge[key]).to eq(value)
        end
      end

      it "assigns the requested challenge as @challenge" do
        challenge = Challenge.create! valid_attributes
        put :update, {:id => challenge.to_param, :challenge => valid_attributes}, valid_session
        expect(assigns(:challenge)).to eq(challenge)
      end

      it "redirects to the challenge" do
        challenge = Challenge.create! valid_attributes
        put :update, {:id => challenge.to_param, :challenge => valid_attributes}, valid_session
        expect(response).to redirect_to(challenge)
      end
    end

    context "with invalid params" do
      it "assigns the challenge as @challenge" do
        challenge = Challenge.create! valid_attributes
        put :update, {:id => challenge.to_param, :challenge => invalid_attributes}, valid_session
        expect(assigns(:challenge)).to eq(challenge)
      end

      it "re-renders the 'edit' template" do
        challenge = Challenge.create! valid_attributes
        put :update, {:id => challenge.to_param, :challenge => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested challenge" do
      challenge = Challenge.create! valid_attributes
      expect {
        delete :destroy, {:id => challenge.to_param}, valid_session
      }.to change(Challenge, :count).by(-1)
    end

    it "redirects to the challenges list" do
      challenge = Challenge.create! valid_attributes
      delete :destroy, {:id => challenge.to_param}, valid_session
      expect(response).to redirect_to(challenges_url)
    end
  end

  # callbacks and filters
  it { should use_before_filter(:authenticate_participant!) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:set_challenge) }

end
