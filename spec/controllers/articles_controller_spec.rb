require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  render_views

  let(:participant) { create :participant, admin: true }

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:article, participant_id: participant.id)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:article, :invalid)
  }

  3.times do |i|
    let!("article_#{i + 1}") { create :article, participant: participant }
  end

  context 'admin' do
    before do
      sign_in participant
    end

    describe 'GET #index' do
      before { get :index }
      it { expect(assigns(:articles).sort).to eq [article_1, article_2, article_3].sort }
      it { expect(response).to render_template :index }
    end

    describe 'GET #show' do
      before { get :show, params: { id: article_1.id } }
      it { expect(assigns(:article)).to eq article_1 }
      it { expect(response).to render_template :show }
    end

    describe "GET #new" do
      before { get :new }
      it { expect(assigns(:article)).to be_a_new(Article) }
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Article" do
          expect {
            post :create, params: { article: valid_attributes}
          }.to change(Article, :count).by(1)
        end

        it "assigns a newly created article as @article" do
          post :create, params: { article: valid_attributes}
          expect(assigns(:article)).to be_a(Article)
          expect(assigns(:article)).to be_persisted
        end

        #it "redirects to the created article" do
        #  post :create, params: { article: valid_attributes}
        #  expect(response).to redirect_to(Article.last)
        #end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved article as @article" do
          post :create, params: { article: invalid_attributes}
          expect(assigns(:article)).to be_a_new(Article)
        end

        it "re-renders the 'new' template" do
          post :create, params: { article: invalid_attributes}
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          { article: 'A new body of article text' }
        }

        it "updates the requested article" do
          article = Article.create! valid_attributes
          put :update, params: { id: article.to_param, article: new_attributes}
          article.reload
          expect(article.article).to eq(new_attributes[:article])
        end

        it "assigns the requested article as @article" do
          article = Article.create! valid_attributes
          put :update, params: {id: article.to_param, article: valid_attributes}
          expect(assigns(:article)).to eq(article)
        end

        it "redirects to the article" do
          article = Article.create! valid_attributes
          put :update, params: { id: article.to_param, article: valid_attributes}
          expect(response).to redirect_to(article)
        end
      end

      context "with invalid params" do
        it "assigns the article as @article" do
          article = Article.create! valid_attributes
          put :update, params: { id: article.to_param, article: invalid_attributes}
          expect(assigns(:article)).to eq(article)
        end

        it "re-renders the 'edit' template" do
          article = Article.create! valid_attributes
          put :update, params: { id: article.to_param, article: invalid_attributes}
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested article" do
        article = Article.create! valid_attributes
        expect {
          delete :destroy, params: { id: article.to_param }
        }.to change(Article, :count).by(-1)
      end

      it "redirects to the articles list" do
        article = Article.create! valid_attributes
        delete :destroy, params: { id: article.to_param }
        expect(response).to redirect_to(articles_url)
      end
    end
  end

end
