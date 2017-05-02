require 'rails_helper'

RSpec.describe ArticleSectionsController, type: :controller do

=begin
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }


  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all article_sections_controllers as @article_sections_controllers" do
      article_sections_controller = ArticleSectionsController.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:article_sections_controllers)).to eq([article_sections_controller])
    end
  end

  describe "GET #show" do
    it "assigns the requested article_sections_controller as @article_sections_controller" do
      article_sections_controller = ArticleSectionsController.create! valid_attributes
      get :show, params: {id: article_sections_controller.to_param}, session: valid_session
      expect(assigns(:article_sections_controller)).to eq(article_sections_controller)
    end
  end

  describe "GET #new" do
    it "assigns a new article_sections_controller as @article_sections_controller" do
      get :new, params: {}, session: valid_session
      expect(assigns(:article_sections_controller)).to be_a_new(ArticleSectionsController)
    end
  end

  describe "GET #edit" do
    it "assigns the requested article_sections_controller as @article_sections_controller" do
      article_sections_controller = ArticleSectionsController.create! valid_attributes
      get :edit, params: {id: article_sections_controller.to_param}, session: valid_session
      expect(assigns(:article_sections_controller)).to eq(article_sections_controller)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ArticleSectionsController" do
        expect {
          post :create, params: {article_sections_controller: valid_attributes}, session: valid_session
        }.to change(ArticleSectionsController, :count).by(1)
      end

      it "assigns a newly created article_sections_controller as @article_sections_controller" do
        post :create, params: {article_sections_controller: valid_attributes}, session: valid_session
        expect(assigns(:article_sections_controller)).to be_a(ArticleSectionsController)
        expect(assigns(:article_sections_controller)).to be_persisted
      end

      it "redirects to the created article_sections_controller" do
        post :create, params: {article_sections_controller: valid_attributes}, session: valid_session
        expect(response).to redirect_to(ArticleSectionsController.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved article_sections_controller as @article_sections_controller" do
        post :create, params: {article_sections_controller: invalid_attributes}, session: valid_session
        expect(assigns(:article_sections_controller)).to be_a_new(ArticleSectionsController)
      end

      it "re-renders the 'new' template" do
        post :create, params: {article_sections_controller: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested article_sections_controller" do
        article_sections_controller = ArticleSectionsController.create! valid_attributes
        put :update, params: {id: article_sections_controller.to_param, article_sections_controller: new_attributes}, session: valid_session
        article_sections_controller.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested article_sections_controller as @article_sections_controller" do
        article_sections_controller = ArticleSectionsController.create! valid_attributes
        put :update, params: {id: article_sections_controller.to_param, article_sections_controller: valid_attributes}, session: valid_session
        expect(assigns(:article_sections_controller)).to eq(article_sections_controller)
      end

      it "redirects to the article_sections_controller" do
        article_sections_controller = ArticleSectionsController.create! valid_attributes
        put :update, params: {id: article_sections_controller.to_param, article_sections_controller: valid_attributes}, session: valid_session
        expect(response).to redirect_to(article_sections_controller)
      end
    end

    context "with invalid params" do
      it "assigns the article_sections_controller as @article_sections_controller" do
        article_sections_controller = ArticleSectionsController.create! valid_attributes
        put :update, params: {id: article_sections_controller.to_param, article_sections_controller: invalid_attributes}, session: valid_session
        expect(assigns(:article_sections_controller)).to eq(article_sections_controller)
      end

      it "re-renders the 'edit' template" do
        article_sections_controller = ArticleSectionsController.create! valid_attributes
        put :update, params: {id: article_sections_controller.to_param, article_sections_controller: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested article_sections_controller" do
      article_sections_controller = ArticleSectionsController.create! valid_attributes
      expect {
        delete :destroy, params: {id: article_sections_controller.to_param}, session: valid_session
      }.to change(ArticleSectionsController, :count).by(-1)
    end

    it "redirects to the article_sections_controllers list" do
      article_sections_controller = ArticleSectionsController.create! valid_attributes
      delete :destroy, params: {id: article_sections_controller.to_param}, session: valid_session
      expect(response).to redirect_to(article_sections_controllers_url)
    end
  end
=end
end
