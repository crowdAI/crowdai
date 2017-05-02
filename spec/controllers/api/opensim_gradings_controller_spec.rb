require 'rails_helper'

RSpec.describe Api::OpensimGradingsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Api::OpensimGradingsController. As you add validations to Api::OpensimGradingsController, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Api::OpensimGradingsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all api_opensim_gradings_controllers as @api_opensim_gradings_controllers" do
      opensim_gradings_controller = Api::OpensimGradingsController.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:api_opensim_gradings_controllers)).to eq([opensim_gradings_controller])
    end
  end

  describe "GET #show" do
    it "assigns the requested api_opensim_gradings_controller as @api_opensim_gradings_controller" do
      opensim_gradings_controller = Api::OpensimGradingsController.create! valid_attributes
      get :show, params: {id: opensim_gradings_controller.to_param}, session: valid_session
      expect(assigns(:api_opensim_gradings_controller)).to eq(opensim_gradings_controller)
    end
  end

  describe "GET #new" do
    it "assigns a new api_opensim_gradings_controller as @api_opensim_gradings_controller" do
      get :new, params: {}, session: valid_session
      expect(assigns(:api_opensim_gradings_controller)).to be_a_new(Api::OpensimGradingsController)
    end
  end

  describe "GET #edit" do
    it "assigns the requested api_opensim_gradings_controller as @api_opensim_gradings_controller" do
      opensim_gradings_controller = Api::OpensimGradingsController.create! valid_attributes
      get :edit, params: {id: opensim_gradings_controller.to_param}, session: valid_session
      expect(assigns(:api_opensim_gradings_controller)).to eq(opensim_gradings_controller)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Api::OpensimGradingsController" do
        expect {
          post :create, params: {api_opensim_gradings_controller: valid_attributes}, session: valid_session
        }.to change(Api::OpensimGradingsController, :count).by(1)
      end

      it "assigns a newly created api_opensim_gradings_controller as @api_opensim_gradings_controller" do
        post :create, params: {api_opensim_gradings_controller: valid_attributes}, session: valid_session
        expect(assigns(:api_opensim_gradings_controller)).to be_a(Api::OpensimGradingsController)
        expect(assigns(:api_opensim_gradings_controller)).to be_persisted
      end

      it "redirects to the created api_opensim_gradings_controller" do
        post :create, params: {api_opensim_gradings_controller: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Api::OpensimGradingsController.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved api_opensim_gradings_controller as @api_opensim_gradings_controller" do
        post :create, params: {api_opensim_gradings_controller: invalid_attributes}, session: valid_session
        expect(assigns(:api_opensim_gradings_controller)).to be_a_new(Api::OpensimGradingsController)
      end

      it "re-renders the 'new' template" do
        post :create, params: {api_opensim_gradings_controller: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested api_opensim_gradings_controller" do
        opensim_gradings_controller = Api::OpensimGradingsController.create! valid_attributes
        put :update, params: {id: opensim_gradings_controller.to_param, api_opensim_gradings_controller: new_attributes}, session: valid_session
        opensim_gradings_controller.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested api_opensim_gradings_controller as @api_opensim_gradings_controller" do
        opensim_gradings_controller = Api::OpensimGradingsController.create! valid_attributes
        put :update, params: {id: opensim_gradings_controller.to_param, api_opensim_gradings_controller: valid_attributes}, session: valid_session
        expect(assigns(:api_opensim_gradings_controller)).to eq(opensim_gradings_controller)
      end

      it "redirects to the api_opensim_gradings_controller" do
        opensim_gradings_controller = Api::OpensimGradingsController.create! valid_attributes
        put :update, params: {id: opensim_gradings_controller.to_param, api_opensim_gradings_controller: valid_attributes}, session: valid_session
        expect(response).to redirect_to(opensim_gradings_controller)
      end
    end

    context "with invalid params" do
      it "assigns the api_opensim_gradings_controller as @api_opensim_gradings_controller" do
        opensim_gradings_controller = Api::OpensimGradingsController.create! valid_attributes
        put :update, params: {id: opensim_gradings_controller.to_param, api_opensim_gradings_controller: invalid_attributes}, session: valid_session
        expect(assigns(:api_opensim_gradings_controller)).to eq(opensim_gradings_controller)
      end

      it "re-renders the 'edit' template" do
        opensim_gradings_controller = Api::OpensimGradingsController.create! valid_attributes
        put :update, params: {id: opensim_gradings_controller.to_param, api_opensim_gradings_controller: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested api_opensim_gradings_controller" do
      opensim_gradings_controller = Api::OpensimGradingsController.create! valid_attributes
      expect {
        delete :destroy, params: {id: opensim_gradings_controller.to_param}, session: valid_session
      }.to change(Api::OpensimGradingsController, :count).by(-1)
    end

    it "redirects to the api_opensim_gradings_controllers list" do
      opensim_gradings_controller = Api::OpensimGradingsController.create! valid_attributes
      delete :destroy, params: {id: opensim_gradings_controller.to_param}, session: valid_session
      expect(response).to redirect_to(api_opensim_gradings_controllers_url)
    end
  end

end
