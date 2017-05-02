require 'rails_helper'

RSpec.describe SubmissionFilesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # SubmissionFile. As you add validations to SubmissionFile, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SubmissionFilesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all submission_files as @submission_files" do
      submission_file = SubmissionFile.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:submission_files)).to eq([submission_file])
    end
  end

  describe "GET #show" do
    it "assigns the requested submission_file as @submission_file" do
      submission_file = SubmissionFile.create! valid_attributes
      get :show, params: {id: submission_file.to_param}, session: valid_session
      expect(assigns(:submission_file)).to eq(submission_file)
    end
  end

  describe "GET #new" do
    it "assigns a new submission_file as @submission_file" do
      get :new, params: {}, session: valid_session
      expect(assigns(:submission_file)).to be_a_new(SubmissionFile)
    end
  end

  describe "GET #edit" do
    it "assigns the requested submission_file as @submission_file" do
      submission_file = SubmissionFile.create! valid_attributes
      get :edit, params: {id: submission_file.to_param}, session: valid_session
      expect(assigns(:submission_file)).to eq(submission_file)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new SubmissionFile" do
        expect {
          post :create, params: {submission_file: valid_attributes}, session: valid_session
        }.to change(SubmissionFile, :count).by(1)
      end

      it "assigns a newly created submission_file as @submission_file" do
        post :create, params: {submission_file: valid_attributes}, session: valid_session
        expect(assigns(:submission_file)).to be_a(SubmissionFile)
        expect(assigns(:submission_file)).to be_persisted
      end

      it "redirects to the created submission_file" do
        post :create, params: {submission_file: valid_attributes}, session: valid_session
        expect(response).to redirect_to(SubmissionFile.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved submission_file as @submission_file" do
        post :create, params: {submission_file: invalid_attributes}, session: valid_session
        expect(assigns(:submission_file)).to be_a_new(SubmissionFile)
      end

      it "re-renders the 'new' template" do
        post :create, params: {submission_file: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested submission_file" do
        submission_file = SubmissionFile.create! valid_attributes
        put :update, params: {id: submission_file.to_param, submission_file: new_attributes}, session: valid_session
        submission_file.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested submission_file as @submission_file" do
        submission_file = SubmissionFile.create! valid_attributes
        put :update, params: {id: submission_file.to_param, submission_file: valid_attributes}, session: valid_session
        expect(assigns(:submission_file)).to eq(submission_file)
      end

      it "redirects to the submission_file" do
        submission_file = SubmissionFile.create! valid_attributes
        put :update, params: {id: submission_file.to_param, submission_file: valid_attributes}, session: valid_session
        expect(response).to redirect_to(submission_file)
      end
    end

    context "with invalid params" do
      it "assigns the submission_file as @submission_file" do
        submission_file = SubmissionFile.create! valid_attributes
        put :update, params: {id: submission_file.to_param, submission_file: invalid_attributes}, session: valid_session
        expect(assigns(:submission_file)).to eq(submission_file)
      end

      it "re-renders the 'edit' template" do
        submission_file = SubmissionFile.create! valid_attributes
        put :update, params: {id: submission_file.to_param, submission_file: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested submission_file" do
      submission_file = SubmissionFile.create! valid_attributes
      expect {
        delete :destroy, params: {id: submission_file.to_param}, session: valid_session
      }.to change(SubmissionFile, :count).by(-1)
    end

    it "redirects to the submission_files list" do
      submission_file = SubmissionFile.create! valid_attributes
      delete :destroy, params: {id: submission_file.to_param}, session: valid_session
      expect(response).to redirect_to(submission_files_url)
    end
  end

end
