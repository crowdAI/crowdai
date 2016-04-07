require 'rails_helper'


RSpec.describe DatasetFilesController, type: :controller do


  let(:valid_attributes) {
    FactoryGirl.build(:dataset_file).attributes
  }

  let(:invalid_attributes) {
    FactoryGirl.build(:dataset_file, seq: 'abcd').attributes
  }

  let(:valid_session) { {} }

  before(:each) do
    double_sign_in
  end

  describe "GET #index" do
    it "assigns all dataset_files as @dataset_files" do
      dataset_file = DatasetFile.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:dataset_files)).to eq([dataset_file])
    end
  end

  describe "GET #show" do
    it "assigns the requested dataset_file as @dataset_file" do
      dataset_file = DatasetFile.create! valid_attributes
      get :show, {:id => dataset_file.to_param}, valid_session
      expect(assigns(:dataset_file)).to eq(dataset_file)
    end
  end

  describe "GET #new" do
    it "assigns a new dataset_file as @dataset_file" do
      get :new, {}, valid_session
      expect(assigns(:dataset_file)).to be_a_new(DatasetFile)
    end
  end

  describe "GET #edit" do
    it "assigns the requested dataset_file as @dataset_file" do
      dataset_file = DatasetFile.create! valid_attributes
      get :edit, {:id => dataset_file.to_param}, valid_session
      expect(assigns(:dataset_file)).to eq(dataset_file)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new DatasetFile" do
        expect {
          post :create, {:dataset_file => valid_attributes}, valid_session
        }.to change(DatasetFile, :count).by(1)
      end

      it "assigns a newly created dataset_file as @dataset_file" do
        post :create, {:dataset_file => valid_attributes}, valid_session
        expect(assigns(:dataset_file)).to be_a(DatasetFile)
        expect(assigns(:dataset_file)).to be_persisted
      end

      it "redirects to the created dataset_file" do
        post :create, {:dataset_file => valid_attributes}, valid_session
        expect(response).to redirect_to(DatasetFile.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved dataset_file as @dataset_file" do
        post :create, {:dataset_file => invalid_attributes}, valid_session
        expect(assigns(:dataset_file)).to be_a_new(DatasetFile)
      end

      it "re-renders the 'new' template" do
        post :create, {:dataset_file => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested dataset_file" do
        dataset_file = DatasetFile.create! valid_attributes
        put :update, {:id => dataset_file.to_param, :dataset_file => new_attributes}, valid_session
        dataset_file.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested dataset_file as @dataset_file" do
        dataset_file = DatasetFile.create! valid_attributes
        put :update, {:id => dataset_file.to_param, :dataset_file => valid_attributes}, valid_session
        expect(assigns(:dataset_file)).to eq(dataset_file)
      end

      it "redirects to the dataset_file" do
        dataset_file = DatasetFile.create! valid_attributes
        put :update, {:id => dataset_file.to_param, :dataset_file => valid_attributes}, valid_session
        expect(response).to redirect_to(dataset_file)
      end
    end

    context "with invalid params" do
      it "assigns the dataset_file as @dataset_file" do
        dataset_file = DatasetFile.create! valid_attributes
        put :update, {:id => dataset_file.to_param, :dataset_file => invalid_attributes}, valid_session
        expect(assigns(:dataset_file)).to eq(dataset_file)
      end

      it "re-renders the 'edit' template" do
        dataset_file = DatasetFile.create! valid_attributes
        put :update, {:id => dataset_file.to_param, :dataset_file => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested dataset_file" do
      dataset_file = DatasetFile.create! valid_attributes
      expect {
        delete :destroy, {:id => dataset_file.to_param}, valid_session
      }.to change(DatasetFile, :count).by(-1)
    end

    it "redirects to the dataset_files list" do
      dataset_file = DatasetFile.create! valid_attributes
      delete :destroy, {:id => dataset_file.to_param}, valid_session
      expect(response).to redirect_to(dataset_files_url)
    end
  end

  # === Routes (REST) ===
  it { should route(:get, '/challenges/1/dataset_files/new').to('dataset_files#new', {:challenge_id=>"1"}) }
  it { should route(:get, '/challenges/1/dataset_files').to('dataset_files#index', {:challenge_id=>"1"}) }
  it { should route(:patch, '/challenges/1/dataset_files/1').to('dataset_files#update', {:challenge_id=>"1", :id=>"1"}) }
  it { should route(:post, '/challenges/1/dataset_files').to('dataset_files#create', {:challenge_id=>"1"}) }
  it { should route(:get, '/challenges/1/dataset_files/1/edit').to('dataset_files#edit', {:challenge_id=>"1", :id=>"1"}) }
  it { should route(:delete, '/challenges/1/dataset_files/1').to('dataset_files#destroy', {:challenge_id=>"1", :id=>"1"}) }
  it { should route(:get, '/challenges/1/dataset_files/1').to('dataset_files#show', {:challenge_id=>"1", :id=>"1"}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_xhr_redirected_to) }
  it { should use_before_filter(:set_request_method_cookie) }
  it { should use_before_filter(:authenticate_user!) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:set_dataset_file) }
  it { should use_before_filter(:set_challenge) }
  # === Callbacks (After) ===
  it { should use_after_filter(:abort_xdomain_redirect) }
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===

end
