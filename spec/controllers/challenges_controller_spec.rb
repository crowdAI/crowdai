require 'rails_helper'

RSpec.describe ChallengesController, type: :controller do

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:challenge)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:challenge, created_at: 'wrong')
  }

  let(:valid_session) { {} }

  before(:each) do
    sign_in
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
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested challenge" do
        challenge = Challenge.create! valid_attributes
        put :update, {:id => challenge.to_param, :challenge => new_attributes}, valid_session
        challenge.reload
        skip("Add assertions for updated state")
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

  # === Routes (REST) ===
  it { should route(:get, '/hosting_institutions/1/challenges/new').to('challenges#new', {:hosting_institution_id=>"1"}) }
  it { should route(:get, '/hosting_institutions/1/challenges').to('challenges#index', {:hosting_institution_id=>"1"}) }
  it { should route(:patch, '/hosting_institutions/1/challenges/1').to('challenges#update', {:hosting_institution_id=>"1", :id=>"1"}) }
  it { should route(:post, '/hosting_institutions/1/challenges').to('challenges#create', {:hosting_institution_id=>"1"}) }
  it { should route(:get, '/hosting_institutions/1/challenges/1/edit').to('challenges#edit', {:hosting_institution_id=>"1", :id=>"1"}) }
  it { should route(:delete, '/hosting_institutions/1/challenges/1').to('challenges#destroy', {:hosting_institution_id=>"1", :id=>"1"}) }
  it { should route(:get, '/hosting_institutions/1/challenges/1').to('challenges#show', {:hosting_institution_id=>"1", :id=>"1"}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_xhr_redirected_to) }
  it { should use_before_filter(:set_request_method_cookie) }
  it { should use_before_filter(:authenticate_user!) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:set_challenge) }
  # === Callbacks (After) ===
  it { should use_after_filter(:abort_xdomain_redirect) }
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===

end
