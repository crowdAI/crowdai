require 'rails_helper'


RSpec.describe LeaderboardsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # LeaderboardsController. As you add validations to LeaderboardsController, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LeaderboardsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all leaderboards_controllers as @leaderboards_controllers" do
      leaderboards_controller = LeaderboardsController.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:leaderboards_controllers)).to eq([leaderboards_controller])
    end
  end

  describe "GET #show" do
    it "assigns the requested leaderboards_controller as @leaderboards_controller" do
      leaderboards_controller = LeaderboardsController.create! valid_attributes
      get :show, params: {id: leaderboards_controller.to_param}, session: valid_session
      expect(assigns(:leaderboards_controller)).to eq(leaderboards_controller)
    end
  end

  describe "GET #new" do
    it "assigns a new leaderboards_controller as @leaderboards_controller" do
      get :new, params: {}, session: valid_session
      expect(assigns(:leaderboards_controller)).to be_a_new(LeaderboardsController)
    end
  end

  describe "GET #edit" do
    it "assigns the requested leaderboards_controller as @leaderboards_controller" do
      leaderboards_controller = LeaderboardsController.create! valid_attributes
      get :edit, params: {id: leaderboards_controller.to_param}, session: valid_session
      expect(assigns(:leaderboards_controller)).to eq(leaderboards_controller)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new LeaderboardsController" do
        expect {
          post :create, params: {leaderboards_controller: valid_attributes}, session: valid_session
        }.to change(LeaderboardsController, :count).by(1)
      end

      it "assigns a newly created leaderboards_controller as @leaderboards_controller" do
        post :create, params: {leaderboards_controller: valid_attributes}, session: valid_session
        expect(assigns(:leaderboards_controller)).to be_a(LeaderboardsController)
        expect(assigns(:leaderboards_controller)).to be_persisted
      end

      it "redirects to the created leaderboards_controller" do
        post :create, params: {leaderboards_controller: valid_attributes}, session: valid_session
        expect(response).to redirect_to(LeaderboardsController.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved leaderboards_controller as @leaderboards_controller" do
        post :create, params: {leaderboards_controller: invalid_attributes}, session: valid_session
        expect(assigns(:leaderboards_controller)).to be_a_new(LeaderboardsController)
      end

      it "re-renders the 'new' template" do
        post :create, params: {leaderboards_controller: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested leaderboards_controller" do
        leaderboards_controller = LeaderboardsController.create! valid_attributes
        put :update, params: {id: leaderboards_controller.to_param, leaderboards_controller: new_attributes}, session: valid_session
        leaderboards_controller.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested leaderboards_controller as @leaderboards_controller" do
        leaderboards_controller = LeaderboardsController.create! valid_attributes
        put :update, params: {id: leaderboards_controller.to_param, leaderboards_controller: valid_attributes}, session: valid_session
        expect(assigns(:leaderboards_controller)).to eq(leaderboards_controller)
      end

      it "redirects to the leaderboards_controller" do
        leaderboards_controller = LeaderboardsController.create! valid_attributes
        put :update, params: {id: leaderboards_controller.to_param, leaderboards_controller: valid_attributes}, session: valid_session
        expect(response).to redirect_to(leaderboards_controller)
      end
    end

    context "with invalid params" do
      it "assigns the leaderboards_controller as @leaderboards_controller" do
        leaderboards_controller = LeaderboardsController.create! valid_attributes
        put :update, params: {id: leaderboards_controller.to_param, leaderboards_controller: invalid_attributes}, session: valid_session
        expect(assigns(:leaderboards_controller)).to eq(leaderboards_controller)
      end

      it "re-renders the 'edit' template" do
        leaderboards_controller = LeaderboardsController.create! valid_attributes
        put :update, params: {id: leaderboards_controller.to_param, leaderboards_controller: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested leaderboards_controller" do
      leaderboards_controller = LeaderboardsController.create! valid_attributes
      expect {
        delete :destroy, params: {id: leaderboards_controller.to_param}, session: valid_session
      }.to change(LeaderboardsController, :count).by(-1)
    end

    it "redirects to the leaderboards_controllers list" do
      leaderboards_controller = LeaderboardsController.create! valid_attributes
      delete :destroy, params: {id: leaderboards_controller.to_param}, session: valid_session
      expect(response).to redirect_to(leaderboards_controllers_url)
    end
  end

end
