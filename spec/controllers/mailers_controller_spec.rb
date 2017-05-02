require 'rails_helper'


RSpec.describe MailersController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # MailersController. As you add validations to MailersController, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MailersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all mailers_controllers as @mailers_controllers" do
      mailers_controller = MailersController.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:mailers_controllers)).to eq([mailers_controller])
    end
  end

  describe "GET #show" do
    it "assigns the requested mailers_controller as @mailers_controller" do
      mailers_controller = MailersController.create! valid_attributes
      get :show, params: {id: mailers_controller.to_param}, session: valid_session
      expect(assigns(:mailers_controller)).to eq(mailers_controller)
    end
  end

  describe "GET #new" do
    it "assigns a new mailers_controller as @mailers_controller" do
      get :new, params: {}, session: valid_session
      expect(assigns(:mailers_controller)).to be_a_new(MailersController)
    end
  end

  describe "GET #edit" do
    it "assigns the requested mailers_controller as @mailers_controller" do
      mailers_controller = MailersController.create! valid_attributes
      get :edit, params: {id: mailers_controller.to_param}, session: valid_session
      expect(assigns(:mailers_controller)).to eq(mailers_controller)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new MailersController" do
        expect {
          post :create, params: {mailers_controller: valid_attributes}, session: valid_session
        }.to change(MailersController, :count).by(1)
      end

      it "assigns a newly created mailers_controller as @mailers_controller" do
        post :create, params: {mailers_controller: valid_attributes}, session: valid_session
        expect(assigns(:mailers_controller)).to be_a(MailersController)
        expect(assigns(:mailers_controller)).to be_persisted
      end

      it "redirects to the created mailers_controller" do
        post :create, params: {mailers_controller: valid_attributes}, session: valid_session
        expect(response).to redirect_to(MailersController.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved mailers_controller as @mailers_controller" do
        post :create, params: {mailers_controller: invalid_attributes}, session: valid_session
        expect(assigns(:mailers_controller)).to be_a_new(MailersController)
      end

      it "re-renders the 'new' template" do
        post :create, params: {mailers_controller: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested mailers_controller" do
        mailers_controller = MailersController.create! valid_attributes
        put :update, params: {id: mailers_controller.to_param, mailers_controller: new_attributes}, session: valid_session
        mailers_controller.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested mailers_controller as @mailers_controller" do
        mailers_controller = MailersController.create! valid_attributes
        put :update, params: {id: mailers_controller.to_param, mailers_controller: valid_attributes}, session: valid_session
        expect(assigns(:mailers_controller)).to eq(mailers_controller)
      end

      it "redirects to the mailers_controller" do
        mailers_controller = MailersController.create! valid_attributes
        put :update, params: {id: mailers_controller.to_param, mailers_controller: valid_attributes}, session: valid_session
        expect(response).to redirect_to(mailers_controller)
      end
    end

    context "with invalid params" do
      it "assigns the mailers_controller as @mailers_controller" do
        mailers_controller = MailersController.create! valid_attributes
        put :update, params: {id: mailers_controller.to_param, mailers_controller: invalid_attributes}, session: valid_session
        expect(assigns(:mailers_controller)).to eq(mailers_controller)
      end

      it "re-renders the 'edit' template" do
        mailers_controller = MailersController.create! valid_attributes
        put :update, params: {id: mailers_controller.to_param, mailers_controller: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested mailers_controller" do
      mailers_controller = MailersController.create! valid_attributes
      expect {
        delete :destroy, params: {id: mailers_controller.to_param}, session: valid_session
      }.to change(MailersController, :count).by(-1)
    end

    it "redirects to the mailers_controllers list" do
      mailers_controller = MailersController.create! valid_attributes
      delete :destroy, params: {id: mailers_controller.to_param}, session: valid_session
      expect(response).to redirect_to(mailers_controllers_url)
    end
  end

end
