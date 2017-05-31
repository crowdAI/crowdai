require 'rails_helper'

=begin
RSpec.describe OrganizersController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # OrganizersController. As you add validations to OrganizersController, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OrganizersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all organizers_controllers as @organizers_controllers" do
      organizers_controller = OrganizersController.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:organizers_controllers)).to eq([organizers_controller])
    end
  end

  describe "GET #show" do
    it "assigns the requested organizers_controller as @organizers_controller" do
      organizers_controller = OrganizersController.create! valid_attributes
      get :show, params: {id: organizers_controller.to_param}, session: valid_session
      expect(assigns(:organizers_controller)).to eq(organizers_controller)
    end
  end

  describe "GET #new" do
    it "assigns a new organizers_controller as @organizers_controller" do
      get :new, params: {}, session: valid_session
      expect(assigns(:organizers_controller)).to be_a_new(OrganizersController)
    end
  end

  describe "GET #edit" do
    it "assigns the requested organizers_controller as @organizers_controller" do
      organizers_controller = OrganizersController.create! valid_attributes
      get :edit, params: {id: organizers_controller.to_param}, session: valid_session
      expect(assigns(:organizers_controller)).to eq(organizers_controller)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new OrganizersController" do
        expect {
          post :create, params: {organizers_controller: valid_attributes}, session: valid_session
        }.to change(OrganizersController, :count).by(1)
      end

      it "assigns a newly created organizers_controller as @organizers_controller" do
        post :create, params: {organizers_controller: valid_attributes}, session: valid_session
        expect(assigns(:organizers_controller)).to be_a(OrganizersController)
        expect(assigns(:organizers_controller)).to be_persisted
      end

      it "redirects to the created organizers_controller" do
        post :create, params: {organizers_controller: valid_attributes}, session: valid_session
        expect(response).to redirect_to(OrganizersController.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved organizers_controller as @organizers_controller" do
        post :create, params: {organizers_controller: invalid_attributes}, session: valid_session
        expect(assigns(:organizers_controller)).to be_a_new(OrganizersController)
      end

      it "re-renders the 'new' template" do
        post :create, params: {organizers_controller: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested organizers_controller" do
        organizers_controller = OrganizersController.create! valid_attributes
        put :update, params: {id: organizers_controller.to_param, organizers_controller: new_attributes}, session: valid_session
        organizers_controller.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested organizers_controller as @organizers_controller" do
        organizers_controller = OrganizersController.create! valid_attributes
        put :update, params: {id: organizers_controller.to_param, organizers_controller: valid_attributes}, session: valid_session
        expect(assigns(:organizers_controller)).to eq(organizers_controller)
      end

      it "redirects to the organizers_controller" do
        organizers_controller = OrganizersController.create! valid_attributes
        put :update, params: {id: organizers_controller.to_param, organizers_controller: valid_attributes}, session: valid_session
        expect(response).to redirect_to(organizers_controller)
      end
    end

    context "with invalid params" do
      it "assigns the organizers_controller as @organizers_controller" do
        organizers_controller = OrganizersController.create! valid_attributes
        put :update, params: {id: organizers_controller.to_param, organizers_controller: invalid_attributes}, session: valid_session
        expect(assigns(:organizers_controller)).to eq(organizers_controller)
      end

      it "re-renders the 'edit' template" do
        organizers_controller = OrganizersController.create! valid_attributes
        put :update, params: {id: organizers_controller.to_param, organizers_controller: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested organizers_controller" do
      organizers_controller = OrganizersController.create! valid_attributes
      expect {
        delete :destroy, params: {id: organizers_controller.to_param}, session: valid_session
      }.to change(OrganizersController, :count).by(-1)
    end

    it "redirects to the organizers_controllers list" do
      organizers_controller = OrganizersController.create! valid_attributes
      delete :destroy, params: {id: organizers_controller.to_param}, session: valid_session
      expect(response).to redirect_to(organizers_controllers_url)
    end
  end

end
=end
