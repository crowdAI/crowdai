require 'rails_helper'

RSpec.describe TopicsController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all topics as @topics" do
      topic = Topic.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:topics)).to eq([topic])
    end
  end

  describe "GET #show" do
    it "assigns the requested topic as @topic" do
      topic = Topic.create! valid_attributes
      get :show, {:id => topic.to_param}, valid_session
      expect(assigns(:topic)).to eq(topic)
    end
  end

  describe "GET #new" do
    it "assigns a new topic as @topic" do
      get :new, {}, valid_session
      expect(assigns(:topic)).to be_a_new(Topic)
    end
  end

  describe "GET #edit" do
    it "assigns the requested topic as @topic" do
      topic = Topic.create! valid_attributes
      get :edit, {:id => topic.to_param}, valid_session
      expect(assigns(:topic)).to eq(topic)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Topic" do
        expect {
          post :create, {:topic => valid_attributes}, valid_session
        }.to change(Topic, :count).by(1)
      end

      it "assigns a newly created topic as @topic" do
        post :create, {:topic => valid_attributes}, valid_session
        expect(assigns(:topic)).to be_a(Topic)
        expect(assigns(:topic)).to be_persisted
      end

      it "redirects to the created topic" do
        post :create, {:topic => valid_attributes}, valid_session
        expect(response).to redirect_to(Topic.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved topic as @topic" do
        post :create, {:topic => invalid_attributes}, valid_session
        expect(assigns(:topic)).to be_a_new(Topic)
      end

      it "re-renders the 'new' template" do
        post :create, {:topic => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested topic" do
        topic = Topic.create! valid_attributes
        put :update, {:id => topic.to_param, :topic => new_attributes}, valid_session
        topic.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested topic as @topic" do
        topic = Topic.create! valid_attributes
        put :update, {:id => topic.to_param, :topic => valid_attributes}, valid_session
        expect(assigns(:topic)).to eq(topic)
      end

      it "redirects to the topic" do
        topic = Topic.create! valid_attributes
        put :update, {:id => topic.to_param, :topic => valid_attributes}, valid_session
        expect(response).to redirect_to(topic)
      end
    end

    context "with invalid params" do
      it "assigns the topic as @topic" do
        topic = Topic.create! valid_attributes
        put :update, {:id => topic.to_param, :topic => invalid_attributes}, valid_session
        expect(assigns(:topic)).to eq(topic)
      end

      it "re-renders the 'edit' template" do
        topic = Topic.create! valid_attributes
        put :update, {:id => topic.to_param, :topic => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested topic" do
      topic = Topic.create! valid_attributes
      expect {
        delete :destroy, {:id => topic.to_param}, valid_session
      }.to change(Topic, :count).by(-1)
    end

    it "redirects to the topics list" do
      topic = Topic.create! valid_attributes
      delete :destroy, {:id => topic.to_param}, valid_session
      expect(response).to redirect_to(topics_url)
    end
  end

  # === Routes (REST) ===
  it { should route(:get, '/topics/new').to('topics#new', {}) }
  it { should route(:get, '/topics').to('topics#index', {}) }
  it { should route(:patch, '/topics/1').to('topics#update', {:id=>"1"}) }
  it { should route(:post, '/topics').to('topics#create', {}) }
  it { should route(:get, '/topics/1/edit').to('topics#edit', {:id=>"1"}) }
  it { should route(:delete, '/topics/1').to('topics#destroy', {:id=>"1"}) }
  it { should route(:get, '/topics/1').to('topics#show', {:id=>"1"}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_xhr_redirected_to) }
  it { should use_before_filter(:set_request_method_cookie) }
  it { should use_before_filter(:authenticate_participant!) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:set_topic) }
  it { should use_before_filter(:set_challenge) }
  # === Callbacks (After) ===
  it { should use_after_filter(:abort_xdomain_redirect) }
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===

end
