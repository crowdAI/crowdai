require 'rails_helper'


RSpec.describe SubmissionsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # SubmissionsController. As you add validations to SubmissionsController, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SubmissionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all submissions_controllers as @submissions_controllers" do
      submissions_controller = SubmissionsController.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:submissions_controllers)).to eq([submissions_controller])
    end
  end

  describe "GET #show" do
    it "assigns the requested submissions_controller as @submissions_controller" do
      submissions_controller = SubmissionsController.create! valid_attributes
      get :show, params: {id: submissions_controller.to_param}, session: valid_session
      expect(assigns(:submissions_controller)).to eq(submissions_controller)
    end
  end

  describe "GET #new" do
    it "assigns a new submissions_controller as @submissions_controller" do
      get :new, params: {}, session: valid_session
      expect(assigns(:submissions_controller)).to be_a_new(SubmissionsController)
    end
  end

  describe "GET #edit" do
    it "assigns the requested submissions_controller as @submissions_controller" do
      submissions_controller = SubmissionsController.create! valid_attributes
      get :edit, params: {id: submissions_controller.to_param}, session: valid_session
      expect(assigns(:submissions_controller)).to eq(submissions_controller)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new SubmissionsController" do
        expect {
          post :create, params: {submissions_controller: valid_attributes}, session: valid_session
        }.to change(SubmissionsController, :count).by(1)
      end

      it "assigns a newly created submissions_controller as @submissions_controller" do
        post :create, params: {submissions_controller: valid_attributes}, session: valid_session
        expect(assigns(:submissions_controller)).to be_a(SubmissionsController)
        expect(assigns(:submissions_controller)).to be_persisted
      end

      it "redirects to the created submissions_controller" do
        post :create, params: {submissions_controller: valid_attributes}, session: valid_session
        expect(response).to redirect_to(SubmissionsController.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved submissions_controller as @submissions_controller" do
        post :create, params: {submissions_controller: invalid_attributes}, session: valid_session
        expect(assigns(:submissions_controller)).to be_a_new(SubmissionsController)
      end

      it "re-renders the 'new' template" do
        post :create, params: {submissions_controller: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested submissions_controller" do
        submissions_controller = SubmissionsController.create! valid_attributes
        put :update, params: {id: submissions_controller.to_param, submissions_controller: new_attributes}, session: valid_session
        submissions_controller.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested submissions_controller as @submissions_controller" do
        submissions_controller = SubmissionsController.create! valid_attributes
        put :update, params: {id: submissions_controller.to_param, submissions_controller: valid_attributes}, session: valid_session
        expect(assigns(:submissions_controller)).to eq(submissions_controller)
      end

      it "redirects to the submissions_controller" do
        submissions_controller = SubmissionsController.create! valid_attributes
        put :update, params: {id: submissions_controller.to_param, submissions_controller: valid_attributes}, session: valid_session
        expect(response).to redirect_to(submissions_controller)
      end
    end

    context "with invalid params" do
      it "assigns the submissions_controller as @submissions_controller" do
        submissions_controller = SubmissionsController.create! valid_attributes
        put :update, params: {id: submissions_controller.to_param, submissions_controller: invalid_attributes}, session: valid_session
        expect(assigns(:submissions_controller)).to eq(submissions_controller)
      end

      it "re-renders the 'edit' template" do
        submissions_controller = SubmissionsController.create! valid_attributes
        put :update, params: {id: submissions_controller.to_param, submissions_controller: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested submissions_controller" do
      submissions_controller = SubmissionsController.create! valid_attributes
      expect {
        delete :destroy, params: {id: submissions_controller.to_param}, session: valid_session
      }.to change(SubmissionsController, :count).by(-1)
    end

    it "redirects to the submissions_controllers list" do
      submissions_controller = SubmissionsController.create! valid_attributes
      delete :destroy, params: {id: submissions_controller.to_param}, session: valid_session
      expect(response).to redirect_to(submissions_controllers_url)
    end
  end

end
