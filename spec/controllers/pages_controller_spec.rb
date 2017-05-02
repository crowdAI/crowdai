require 'rails_helper'


RSpec.describe PagesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # PagesController. As you add validations to PagesController, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PagesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all pages_controllers as @pages_controllers" do
      pages_controller = PagesController.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:pages_controllers)).to eq([pages_controller])
    end
  end

  describe "GET #show" do
    it "assigns the requested pages_controller as @pages_controller" do
      pages_controller = PagesController.create! valid_attributes
      get :show, params: {id: pages_controller.to_param}, session: valid_session
      expect(assigns(:pages_controller)).to eq(pages_controller)
    end
  end

  describe "GET #new" do
    it "assigns a new pages_controller as @pages_controller" do
      get :new, params: {}, session: valid_session
      expect(assigns(:pages_controller)).to be_a_new(PagesController)
    end
  end

  describe "GET #edit" do
    it "assigns the requested pages_controller as @pages_controller" do
      pages_controller = PagesController.create! valid_attributes
      get :edit, params: {id: pages_controller.to_param}, session: valid_session
      expect(assigns(:pages_controller)).to eq(pages_controller)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new PagesController" do
        expect {
          post :create, params: {pages_controller: valid_attributes}, session: valid_session
        }.to change(PagesController, :count).by(1)
      end

      it "assigns a newly created pages_controller as @pages_controller" do
        post :create, params: {pages_controller: valid_attributes}, session: valid_session
        expect(assigns(:pages_controller)).to be_a(PagesController)
        expect(assigns(:pages_controller)).to be_persisted
      end

      it "redirects to the created pages_controller" do
        post :create, params: {pages_controller: valid_attributes}, session: valid_session
        expect(response).to redirect_to(PagesController.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved pages_controller as @pages_controller" do
        post :create, params: {pages_controller: invalid_attributes}, session: valid_session
        expect(assigns(:pages_controller)).to be_a_new(PagesController)
      end

      it "re-renders the 'new' template" do
        post :create, params: {pages_controller: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested pages_controller" do
        pages_controller = PagesController.create! valid_attributes
        put :update, params: {id: pages_controller.to_param, pages_controller: new_attributes}, session: valid_session
        pages_controller.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested pages_controller as @pages_controller" do
        pages_controller = PagesController.create! valid_attributes
        put :update, params: {id: pages_controller.to_param, pages_controller: valid_attributes}, session: valid_session
        expect(assigns(:pages_controller)).to eq(pages_controller)
      end

      it "redirects to the pages_controller" do
        pages_controller = PagesController.create! valid_attributes
        put :update, params: {id: pages_controller.to_param, pages_controller: valid_attributes}, session: valid_session
        expect(response).to redirect_to(pages_controller)
      end
    end

    context "with invalid params" do
      it "assigns the pages_controller as @pages_controller" do
        pages_controller = PagesController.create! valid_attributes
        put :update, params: {id: pages_controller.to_param, pages_controller: invalid_attributes}, session: valid_session
        expect(assigns(:pages_controller)).to eq(pages_controller)
      end

      it "re-renders the 'edit' template" do
        pages_controller = PagesController.create! valid_attributes
        put :update, params: {id: pages_controller.to_param, pages_controller: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested pages_controller" do
      pages_controller = PagesController.create! valid_attributes
      expect {
        delete :destroy, params: {id: pages_controller.to_param}, session: valid_session
      }.to change(PagesController, :count).by(-1)
    end

    it "redirects to the pages_controllers list" do
      pages_controller = PagesController.create! valid_attributes
      delete :destroy, params: {id: pages_controller.to_param}, session: valid_session
      expect(response).to redirect_to(pages_controllers_url)
    end
  end

end
