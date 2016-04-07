
require 'rails_helper'


RSpec.describe HostingInstitutionsController, type: :controller do


  let(:valid_attributes) {
    FactoryGirl.build(:hosting_institution).attributes
  }

  let(:invalid_attributes) {
    FactoryGirl.build(:hosting_institution, institution: nil).attributes
  }

  let(:valid_session) { {} }

  before(:each) do
    sign_in
  end

  describe "GET #index" do
    it "assigns all hosting_institutions as @hosting_institutions" do
      hosting_institution = HostingInstitution.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:hosting_institutions)).to eq([hosting_institution])
    end
  end

  describe "GET #show" do
    it "assigns the requested hosting_institution as @hosting_institution" do
      hosting_institution = HostingInstitution.create! valid_attributes
      get :show, {:id => hosting_institution.to_param}, valid_session
      expect(assigns(:hosting_institution)).to eq(hosting_institution)
    end
  end

  describe "GET #new" do
    it "assigns a new hosting_institution as @hosting_institution" do
      get :new, {}, valid_session
      expect(assigns(:hosting_institution)).to be_a_new(HostingInstitution)
    end
  end

  describe "GET #edit" do
    it "assigns the requested hosting_institution as @hosting_institution" do
      hosting_institution = HostingInstitution.create! valid_attributes
      get :edit, {:id => hosting_institution.to_param}, valid_session
      expect(assigns(:hosting_institution)).to eq(hosting_institution)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new HostingInstitution" do
        expect {
          post :create, {:hosting_institution => valid_attributes}, valid_session
        }.to change(HostingInstitution, :count).by(1)
      end

      it "assigns a newly created hosting_institution as @hosting_institution" do
        post :create, {:hosting_institution => valid_attributes}, valid_session
        expect(assigns(:hosting_institution)).to be_a(HostingInstitution)
        expect(assigns(:hosting_institution)).to be_persisted
      end

      it "redirects to the created hosting_institution" do
        post :create, {:hosting_institution => valid_attributes}, valid_session
        expect(response).to redirect_to(HostingInstitution.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved hosting_institution as @hosting_institution" do
        post :create, {:hosting_institution => invalid_attributes}, valid_session
        expect(assigns(:hosting_institution)).to be_a_new(HostingInstitution)
      end

      it "re-renders the 'new' template" do
        post :create, {:hosting_institution => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested hosting_institution" do
        hosting_institution = HostingInstitution.create! valid_attributes
        put :update, {:id => hosting_institution.to_param, :hosting_institution => new_attributes}, valid_session
        hosting_institution.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested hosting_institution as @hosting_institution" do
        hosting_institution = HostingInstitution.create! valid_attributes
        put :update, {:id => hosting_institution.to_param, :hosting_institution => valid_attributes}, valid_session
        expect(assigns(:hosting_institution)).to eq(hosting_institution)
      end

      it "redirects to the hosting_institution" do
        hosting_institution = HostingInstitution.create! valid_attributes
        put :update, {:id => hosting_institution.to_param, :hosting_institution => valid_attributes}, valid_session
        expect(response).to redirect_to(hosting_institution)
      end
    end

    context "with invalid params" do
      it "assigns the hosting_institution as @hosting_institution" do
        hosting_institution = HostingInstitution.create! valid_attributes
        put :update, {:id => hosting_institution.to_param, :hosting_institution => invalid_attributes}, valid_session
        expect(assigns(:hosting_institution)).to eq(hosting_institution)
      end

      it "re-renders the 'edit' template" do
        hosting_institution = HostingInstitution.create! valid_attributes
        put :update, {:id => hosting_institution.to_param, :hosting_institution => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested hosting_institution" do
      hosting_institution = HostingInstitution.create! valid_attributes
      expect {
        delete :destroy, {:id => hosting_institution.to_param}, valid_session
      }.to change(HostingInstitution, :count).by(-1)
    end

    it "redirects to the hosting_institutions list" do
      hosting_institution = HostingInstitution.create! valid_attributes
      delete :destroy, {:id => hosting_institution.to_param}, valid_session
      expect(response).to redirect_to(hosting_institutions_url)
    end
  end

  # === Routes (REST) ===
  it { should route(:get, '/hosting_institutions/new').to('hosting_institutions#new', {}) }
  it { should route(:get, '/hosting_institutions').to('hosting_institutions#index', {}) }
  it { should route(:patch, '/hosting_institutions/1').to('hosting_institutions#update', {:id=>"1"}) }
  it { should route(:post, '/hosting_institutions').to('hosting_institutions#create', {}) }
  it { should route(:get, '/hosting_institutions/1/edit').to('hosting_institutions#edit', {:id=>"1"}) }
  it { should route(:delete, '/hosting_institutions/1').to('hosting_institutions#destroy', {:id=>"1"}) }
  it { should route(:get, '/hosting_institutions/1').to('hosting_institutions#show', {:id=>"1"}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_xhr_redirected_to) }
  it { should use_before_filter(:set_request_method_cookie) }
  it { should use_before_filter(:authenticate_user!) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:set_hosting_institution) }
  # === Callbacks (After) ===
  it { should use_after_filter(:abort_xdomain_redirect) }
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===

end
