
require 'rails_helper'


RSpec.describe OrganizersController, type: :controller do


  let(:valid_attributes) {
    FactoryGirl.build(:organizer).attributes
  }

  let(:invalid_attributes) {
    FactoryGirl.build(:organizer, organizer: nil).attributes
  }

  before(:each) do
    double_sign_in
  end

  let(:valid_session) {{  }}



  describe "GET #index" do
    it "assigns all organizers as @organizers" do
      organizer = Organizer.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:organizers)).to eq([organizer])
    end
  end

  describe "GET #show" do
    it "assigns the requested organizer as @organizer" do
      organizer = Organizer.create! valid_attributes
      get :show, {:id => organizer.to_param}, valid_session
      expect(assigns(:organizer)).to eq(organizer)
    end
  end

  describe "GET #new" do
    it "assigns a new organizer as @organizer" do
      get :new, {}, valid_session
      expect(assigns(:organizer)).to be_a_new(Organizer)
    end
  end

  describe "GET #edit" do
    it "assigns the requested organizer as @organizer" do
      organizer = Organizer.create! valid_attributes
      get :edit, {:id => organizer.to_param}, valid_session
      expect(assigns(:organizer)).to eq(organizer)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Organizer" do
        expect {
          post :create, {:organizer => valid_attributes}, valid_session
        }.to change(Organizer, :count).by(1)
      end

      it "assigns a newly created organizer as @organizer" do
        post :create, {:organizer => valid_attributes}, valid_session
        expect(assigns(:organizer)).to be_a(Organizer)
        expect(assigns(:organizer)).to be_persisted
      end

      it "redirects to the created organizer" do
        post :create, {:organizer => valid_attributes}, valid_session
        expect(response).to redirect_to(Organizer.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved organizer as @organizer" do
        post :create, {:organizer => invalid_attributes}, valid_session
        expect(assigns(:organizer)).to be_a_new(Organizer)
      end

      it "re-renders the 'new' template" do
        post :create, {:organizer => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {description: "changed description", address: 'changed address'}
      }

      it "updates the requested organizer" do
        organizer = Organizer.create! valid_attributes
        put :update, {:id => organizer.to_param, :organizer => new_attributes}, valid_session
        organizer.reload
        new_attributes.each_pair do |key, value|
          expect(organizer[key]).to eq(value)
        end
      end

      it "assigns the requested organizer as @organizer" do
        organizer = Organizer.create! valid_attributes
        put :update, {:id => organizer.to_param, :organizer => valid_attributes}, valid_session
        expect(assigns(:organizer)).to eq(organizer)
      end

      it "redirects to the organizer" do
        organizer = Organizer.create! valid_attributes
        put :update, {:id => organizer.to_param, :organizer => valid_attributes}, valid_session
        expect(response).to redirect_to(organizer)
      end
    end

    context "with invalid params" do
      it "assigns the organizer as @organizer" do
        organizer = Organizer.create! valid_attributes
        put :update, {:id => organizer.to_param, :organizer => invalid_attributes}, valid_session
        expect(assigns(:organizer)).to eq(organizer)
      end

      it "re-renders the 'edit' template" do
        organizer = Organizer.create! valid_attributes
        put :update, {:id => organizer.to_param, :organizer => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested organizer" do
      organizer = Organizer.create! valid_attributes
      expect {
        delete :destroy, {:id => organizer.to_param}, valid_session
      }.to change(Organizer, :count).by(-1)
    end

    it "redirects to the organizers list" do
      organizer = Organizer.create! valid_attributes
      delete :destroy, {:id => organizer.to_param}, valid_session
      expect(response).to redirect_to(organizers_url)
    end
  end

  # === Routes (REST) ===
  it { should route(:get, '/organizers/new').to('organizers#new', {}) }
  it { should route(:get, '/organizers').to('organizers#index', {}) }
  it { should route(:patch, '/organizers/1').to('organizers#update', {:id=>"1"}) }
  it { should route(:post, '/organizers').to('organizers#create', {}) }
  it { should route(:get, '/organizers/1/edit').to('organizers#edit', {:id=>"1"}) }
  it { should route(:delete, '/organizers/1').to('organizers#destroy', {:id=>"1"}) }
  it { should route(:get, '/organizers/1').to('organizers#show', {:id=>"1"}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_xhr_redirected_to) }
  it { should use_before_filter(:set_request_method_cookie) }
  it { should use_before_filter(:authenticate_user!) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:set_organizer) }
  # === Callbacks (After) ===
  it { should use_after_filter(:abort_xdomain_redirect) }
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===

end
