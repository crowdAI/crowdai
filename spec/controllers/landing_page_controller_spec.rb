require 'rails_helper'

RSpec.describe LandingPageController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # LandingPageController. As you add validations to LandingPageController, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LandingPageController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all landing_page_controllers as @landing_page_controllers" do
      landing_page_controller = LandingPageController.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:landing_page_controllers)).to eq([landing_page_controller])
    end
  end

  describe "GET #show" do
    it "assigns the requested landing_page_controller as @landing_page_controller" do
      landing_page_controller = LandingPageController.create! valid_attributes
      get :show, params: {id: landing_page_controller.to_param}, session: valid_session
      expect(assigns(:landing_page_controller)).to eq(landing_page_controller)
    end
  end

  describe "GET #new" do
    it "assigns a new landing_page_controller as @landing_page_controller" do
      get :new, params: {}, session: valid_session
      expect(assigns(:landing_page_controller)).to be_a_new(LandingPageController)
    end
  end

  describe "GET #edit" do
    it "assigns the requested landing_page_controller as @landing_page_controller" do
      landing_page_controller = LandingPageController.create! valid_attributes
      get :edit, params: {id: landing_page_controller.to_param}, session: valid_session
      expect(assigns(:landing_page_controller)).to eq(landing_page_controller)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new LandingPageController" do
        expect {
          post :create, params: {landing_page_controller: valid_attributes}, session: valid_session
        }.to change(LandingPageController, :count).by(1)
      end

      it "assigns a newly created landing_page_controller as @landing_page_controller" do
        post :create, params: {landing_page_controller: valid_attributes}, session: valid_session
        expect(assigns(:landing_page_controller)).to be_a(LandingPageController)
        expect(assigns(:landing_page_controller)).to be_persisted
      end

      it "redirects to the created landing_page_controller" do
        post :create, params: {landing_page_controller: valid_attributes}, session: valid_session
        expect(response).to redirect_to(LandingPageController.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved landing_page_controller as @landing_page_controller" do
        post :create, params: {landing_page_controller: invalid_attributes}, session: valid_session
        expect(assigns(:landing_page_controller)).to be_a_new(LandingPageController)
      end

      it "re-renders the 'new' template" do
        post :create, params: {landing_page_controller: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested landing_page_controller" do
        landing_page_controller = LandingPageController.create! valid_attributes
        put :update, params: {id: landing_page_controller.to_param, landing_page_controller: new_attributes}, session: valid_session
        landing_page_controller.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested landing_page_controller as @landing_page_controller" do
        landing_page_controller = LandingPageController.create! valid_attributes
        put :update, params: {id: landing_page_controller.to_param, landing_page_controller: valid_attributes}, session: valid_session
        expect(assigns(:landing_page_controller)).to eq(landing_page_controller)
      end

      it "redirects to the landing_page_controller" do
        landing_page_controller = LandingPageController.create! valid_attributes
        put :update, params: {id: landing_page_controller.to_param, landing_page_controller: valid_attributes}, session: valid_session
        expect(response).to redirect_to(landing_page_controller)
      end
    end

    context "with invalid params" do
      it "assigns the landing_page_controller as @landing_page_controller" do
        landing_page_controller = LandingPageController.create! valid_attributes
        put :update, params: {id: landing_page_controller.to_param, landing_page_controller: invalid_attributes}, session: valid_session
        expect(assigns(:landing_page_controller)).to eq(landing_page_controller)
      end

      it "re-renders the 'edit' template" do
        landing_page_controller = LandingPageController.create! valid_attributes
        put :update, params: {id: landing_page_controller.to_param, landing_page_controller: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested landing_page_controller" do
      landing_page_controller = LandingPageController.create! valid_attributes
      expect {
        delete :destroy, params: {id: landing_page_controller.to_param}, session: valid_session
      }.to change(LandingPageController, :count).by(-1)
    end

    it "redirects to the landing_page_controllers list" do
      landing_page_controller = LandingPageController.create! valid_attributes
      delete :destroy, params: {id: landing_page_controller.to_param}, session: valid_session
      expect(response).to redirect_to(landing_page_controllers_url)
    end
  end

end
