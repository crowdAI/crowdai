require 'rails_helper'

RSpec.describe TopicsController, type: :controller do

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:topic)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:topic, :invalid)
  }

  let!(:admin) { create :participant, :admin }
  let!(:challenge) { create :challenge }
  let!(:topic) { create :topic, challenge_id: challenge.id }

  before do
    sign_in admin
  end

  describe "GET #index" do
    it "assigns all topics as @topics" do
      get :index, params: { challenge_id: challenge.id }
      expect(assigns(:topics)).to eq([topic])
    end
  end

  describe "GET #show" do
    it "assigns the requested topic as @topic" do
      get :show, params: {challenge_id: challenge.id, id: topic.id }
      expect(assigns(:topic)).to eq(topic)
    end
  end

  describe "GET #new" do
    it "assigns a new topic as @topic" do
      get :new, params: { challenge_id: challenge.id }
      expect(assigns(:topic)).to be_a_new(Topic)
    end
  end

  describe "GET #edit" do
    it "assigns the requested topic as @topic" do
      get :edit, params: { challenge_id: challenge.id, id: topic.id }
      expect(assigns(:topic)).to eq(topic)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Topic" do
        expect {
          post :create, params: { challenge_id: challenge.id, topic: valid_attributes }
        }.to change(Topic, :count).by(1)
      end

      it "redirects to the created topics_controller" do
        post :create, params: { challenge_id: challenge.id, topic: valid_attributes}
        expect(response).to redirect_to "/challenges/#{challenge.slug}/topics"
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved topic as @topic" do
        post :create, params: { challenge_id: challenge.id, topic: invalid_attributes}
        expect(assigns(:topic)).to be_a_new(Topic)
      end

      it "re-renders the 'new' template" do
        post :create, params: { challenge_id: challenge.id, topic: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested topic" do
      expect {
        delete :destroy, params: { challenge_id: challenge.id, id: topic.id }
      }.to change(Topic, :count).by(-1)
    end

    it "redirects to the topics list" do
      delete :destroy, params: { challenge_id: challenge.id, id: topic.id }
      expect(response).to redirect_to "/challenges/#{challenge.slug}/topics"
    end
  end

end
