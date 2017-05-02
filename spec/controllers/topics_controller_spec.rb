require 'rails_helper'


RSpec.describe TopicsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # TopicsController. As you add validations to TopicsController, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TopicsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all topics_controllers as @topics_controllers" do
      topics_controller = TopicsController.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:topics_controllers)).to eq([topics_controller])
    end
  end

  describe "GET #show" do
    it "assigns the requested topics_controller as @topics_controller" do
      topics_controller = TopicsController.create! valid_attributes
      get :show, params: {id: topics_controller.to_param}, session: valid_session
      expect(assigns(:topics_controller)).to eq(topics_controller)
    end
  end

  describe "GET #new" do
    it "assigns a new topics_controller as @topics_controller" do
      get :new, params: {}, session: valid_session
      expect(assigns(:topics_controller)).to be_a_new(TopicsController)
    end
  end

  describe "GET #edit" do
    it "assigns the requested topics_controller as @topics_controller" do
      topics_controller = TopicsController.create! valid_attributes
      get :edit, params: {id: topics_controller.to_param}, session: valid_session
      expect(assigns(:topics_controller)).to eq(topics_controller)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new TopicsController" do
        expect {
          post :create, params: {topics_controller: valid_attributes}, session: valid_session
        }.to change(TopicsController, :count).by(1)
      end

      it "assigns a newly created topics_controller as @topics_controller" do
        post :create, params: {topics_controller: valid_attributes}, session: valid_session
        expect(assigns(:topics_controller)).to be_a(TopicsController)
        expect(assigns(:topics_controller)).to be_persisted
      end

      it "redirects to the created topics_controller" do
        post :create, params: {topics_controller: valid_attributes}, session: valid_session
        expect(response).to redirect_to(TopicsController.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved topics_controller as @topics_controller" do
        post :create, params: {topics_controller: invalid_attributes}, session: valid_session
        expect(assigns(:topics_controller)).to be_a_new(TopicsController)
      end

      it "re-renders the 'new' template" do
        post :create, params: {topics_controller: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested topics_controller" do
        topics_controller = TopicsController.create! valid_attributes
        put :update, params: {id: topics_controller.to_param, topics_controller: new_attributes}, session: valid_session
        topics_controller.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested topics_controller as @topics_controller" do
        topics_controller = TopicsController.create! valid_attributes
        put :update, params: {id: topics_controller.to_param, topics_controller: valid_attributes}, session: valid_session
        expect(assigns(:topics_controller)).to eq(topics_controller)
      end

      it "redirects to the topics_controller" do
        topics_controller = TopicsController.create! valid_attributes
        put :update, params: {id: topics_controller.to_param, topics_controller: valid_attributes}, session: valid_session
        expect(response).to redirect_to(topics_controller)
      end
    end

    context "with invalid params" do
      it "assigns the topics_controller as @topics_controller" do
        topics_controller = TopicsController.create! valid_attributes
        put :update, params: {id: topics_controller.to_param, topics_controller: invalid_attributes}, session: valid_session
        expect(assigns(:topics_controller)).to eq(topics_controller)
      end

      it "re-renders the 'edit' template" do
        topics_controller = TopicsController.create! valid_attributes
        put :update, params: {id: topics_controller.to_param, topics_controller: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested topics_controller" do
      topics_controller = TopicsController.create! valid_attributes
      expect {
        delete :destroy, params: {id: topics_controller.to_param}, session: valid_session
      }.to change(TopicsController, :count).by(-1)
    end

    it "redirects to the topics_controllers list" do
      topics_controller = TopicsController.create! valid_attributes
      delete :destroy, params: {id: topics_controller.to_param}, session: valid_session
      expect(response).to redirect_to(topics_controllers_url)
    end
  end

end
