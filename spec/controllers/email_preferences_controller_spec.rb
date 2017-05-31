require 'rails_helper'
=begin
RSpec.describe EmailPreferencesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # EmailPreferencesController. As you add validations to EmailPreferencesController, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EmailPreferencesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all email_preferences_controllers as @email_preferences_controllers" do
      email_preferences_controller = EmailPreferencesController.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:email_preferences_controllers)).to eq([email_preferences_controller])
    end
  end

  describe "GET #show" do
    it "assigns the requested email_preferences_controller as @email_preferences_controller" do
      email_preferences_controller = EmailPreferencesController.create! valid_attributes
      get :show, params: {id: email_preferences_controller.to_param}, session: valid_session
      expect(assigns(:email_preferences_controller)).to eq(email_preferences_controller)
    end
  end

  describe "GET #new" do
    it "assigns a new email_preferences_controller as @email_preferences_controller" do
      get :new, params: {}, session: valid_session
      expect(assigns(:email_preferences_controller)).to be_a_new(EmailPreferencesController)
    end
  end

  describe "GET #edit" do
    it "assigns the requested email_preferences_controller as @email_preferences_controller" do
      email_preferences_controller = EmailPreferencesController.create! valid_attributes
      get :edit, params: {id: email_preferences_controller.to_param}, session: valid_session
      expect(assigns(:email_preferences_controller)).to eq(email_preferences_controller)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new EmailPreferencesController" do
        expect {
          post :create, params: {email_preferences_controller: valid_attributes}, session: valid_session
        }.to change(EmailPreferencesController, :count).by(1)
      end

      it "assigns a newly created email_preferences_controller as @email_preferences_controller" do
        post :create, params: {email_preferences_controller: valid_attributes}, session: valid_session
        expect(assigns(:email_preferences_controller)).to be_a(EmailPreferencesController)
        expect(assigns(:email_preferences_controller)).to be_persisted
      end

      it "redirects to the created email_preferences_controller" do
        post :create, params: {email_preferences_controller: valid_attributes}, session: valid_session
        expect(response).to redirect_to(EmailPreferencesController.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved email_preferences_controller as @email_preferences_controller" do
        post :create, params: {email_preferences_controller: invalid_attributes}, session: valid_session
        expect(assigns(:email_preferences_controller)).to be_a_new(EmailPreferencesController)
      end

      it "re-renders the 'new' template" do
        post :create, params: {email_preferences_controller: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested email_preferences_controller" do
        email_preferences_controller = EmailPreferencesController.create! valid_attributes
        put :update, params: {id: email_preferences_controller.to_param, email_preferences_controller: new_attributes}, session: valid_session
        email_preferences_controller.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested email_preferences_controller as @email_preferences_controller" do
        email_preferences_controller = EmailPreferencesController.create! valid_attributes
        put :update, params: {id: email_preferences_controller.to_param, email_preferences_controller: valid_attributes}, session: valid_session
        expect(assigns(:email_preferences_controller)).to eq(email_preferences_controller)
      end

      it "redirects to the email_preferences_controller" do
        email_preferences_controller = EmailPreferencesController.create! valid_attributes
        put :update, params: {id: email_preferences_controller.to_param, email_preferences_controller: valid_attributes}, session: valid_session
        expect(response).to redirect_to(email_preferences_controller)
      end
    end

    context "with invalid params" do
      it "assigns the email_preferences_controller as @email_preferences_controller" do
        email_preferences_controller = EmailPreferencesController.create! valid_attributes
        put :update, params: {id: email_preferences_controller.to_param, email_preferences_controller: invalid_attributes}, session: valid_session
        expect(assigns(:email_preferences_controller)).to eq(email_preferences_controller)
      end

      it "re-renders the 'edit' template" do
        email_preferences_controller = EmailPreferencesController.create! valid_attributes
        put :update, params: {id: email_preferences_controller.to_param, email_preferences_controller: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested email_preferences_controller" do
      email_preferences_controller = EmailPreferencesController.create! valid_attributes
      expect {
        delete :destroy, params: {id: email_preferences_controller.to_param}, session: valid_session
      }.to change(EmailPreferencesController, :count).by(-1)
    end

    it "redirects to the email_preferences_controllers list" do
      email_preferences_controller = EmailPreferencesController.create! valid_attributes
      delete :destroy, params: {id: email_preferences_controller.to_param}, session: valid_session
      expect(response).to redirect_to(email_preferences_controllers_url)
    end
  end

end
=end
