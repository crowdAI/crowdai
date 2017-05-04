require 'rails_helper'


RSpec.describe EmailsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # EmailsController. As you add validations to EmailsController, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EmailsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all emails_controllers as @emails_controllers" do
      emails_controller = EmailsController.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:emails_controllers)).to eq([emails_controller])
    end
  end

  describe "GET #show" do
    it "assigns the requested emails_controller as @emails_controller" do
      emails_controller = EmailsController.create! valid_attributes
      get :show, params: {id: emails_controller.to_param}, session: valid_session
      expect(assigns(:emails_controller)).to eq(emails_controller)
    end
  end

  describe "GET #new" do
    it "assigns a new dataset_file as @dataset_file" do
      get :new, params: {challenge_id: }, session: valid_session
      expect(assigns(:emails_controller)).to be_a_new(EmailsController)
    end
  end

  describe "GET #new" do
    it "assigns a new emails_controller as @emails_controller" do
      get :new, params: {}, session: valid_session
      expect(assigns(:emails_controller)).to be_a_new(EmailsController)
    end
  end

  describe "GET #edit" do
    it "assigns the requested emails_controller as @emails_controller" do
      emails_controller = EmailsController.create! valid_attributes
      get :edit, params: {id: emails_controller.to_param}, session: valid_session
      expect(assigns(:emails_controller)).to eq(emails_controller)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new EmailsController" do
        expect {
          post :create, params: {emails_controller: valid_attributes}, session: valid_session
        }.to change(EmailsController, :count).by(1)
      end

      it "assigns a newly created emails_controller as @emails_controller" do
        post :create, params: {emails_controller: valid_attributes}, session: valid_session
        expect(assigns(:emails_controller)).to be_a(EmailsController)
        expect(assigns(:emails_controller)).to be_persisted
      end

      it "redirects to the created emails_controller" do
        post :create, params: {emails_controller: valid_attributes}, session: valid_session
        expect(response).to redirect_to(EmailsController.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved emails_controller as @emails_controller" do
        post :create, params: {emails_controller: invalid_attributes}, session: valid_session
        expect(assigns(:emails_controller)).to be_a_new(EmailsController)
      end

      it "re-renders the 'new' template" do
        post :create, params: {emails_controller: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested emails_controller" do
        emails_controller = EmailsController.create! valid_attributes
        put :update, params: {id: emails_controller.to_param, emails_controller: new_attributes}, session: valid_session
        emails_controller.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested emails_controller as @emails_controller" do
        emails_controller = EmailsController.create! valid_attributes
        put :update, params: {id: emails_controller.to_param, emails_controller: valid_attributes}, session: valid_session
        expect(assigns(:emails_controller)).to eq(emails_controller)
      end

      it "redirects to the emails_controller" do
        emails_controller = EmailsController.create! valid_attributes
        put :update, params: {id: emails_controller.to_param, emails_controller: valid_attributes}, session: valid_session
        expect(response).to redirect_to(emails_controller)
      end
    end

    context "with invalid params" do
      it "assigns the emails_controller as @emails_controller" do
        emails_controller = EmailsController.create! valid_attributes
        put :update, params: {id: emails_controller.to_param, emails_controller: invalid_attributes}, session: valid_session
        expect(assigns(:emails_controller)).to eq(emails_controller)
      end

      it "re-renders the 'edit' template" do
        emails_controller = EmailsController.create! valid_attributes
        put :update, params: {id: emails_controller.to_param, emails_controller: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested emails_controller" do
      emails_controller = EmailsController.create! valid_attributes
      expect {
        delete :destroy, params: {id: emails_controller.to_param}, session: valid_session
      }.to change(EmailsController, :count).by(-1)
    end

    it "redirects to the emails_controllers list" do
      emails_controller = EmailsController.create! valid_attributes
      delete :destroy, params: {id: emails_controller.to_param}, session: valid_session
      expect(response).to redirect_to(emails_controllers_url)
    end
  end

end
