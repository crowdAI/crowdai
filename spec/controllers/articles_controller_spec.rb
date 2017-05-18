require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  let!(:participant) { create :participant }
  let!(:participant2) { create :participant }
  let!(:article_published) { create :article, article: 'article_published', participant: participant, published: true}
  let!(:article_not_published) { create :article, article: 'article_not_published', participant: participant, published: false}
  let!(:participant2_article_published) { create :article, article: 'participant2_article_published', participant: participant2, published: true}
  let!(:participant2_not_published) { create :article, article: 'participant2_not_published', participant: participant2, published: false}

  def valid_params
    {
      article: {
        article: 'A sample article',
        summary: 'A summary of the article',
        published: true
      }
    }
  end

  def valid_attributes
    valid_params[:article]
  end


  def invalid_params
    {
      article: {
        article: nil,
        summary: 'A summary of the article',
        published: true
      }
    }
  end

  def invalid_attributes
    invalid_params[:article]
  end


  context 'signed in participant' do
    before do
      sign_in participant
    end

    describe 'GET #index' do
      before { get :index }
      it { expect((assigns(:articles).map(&:article)).sort).to eq ['article_published', 'article_not_published', 'participant2_article_published'].sort }
      it { expect(response).to render_template :index }
    end

    describe 'GET #show' do
      before { get :show, id: article_published.id }
      it { expect(assigns(:article)).to eq article_published }
      it { expect(response).to render_template :show }
    end

    describe "GET #new" do
      before { get :new }
      it { expect(assigns(:article)).to be_a_new(Article) }
    end

    describe "GET #edit for own article" do
      before { get :edit, params: { id: article_published } }
      it { expect(assigns(:article)).to eq article_published }
    end

    describe 'GET #edit for other article' do
      before { put :edit, params: { id: participant2_article_published.id } }
      it { denies_access }
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Article" do
          expect {
            post :create, params: valid_params
          }.to change(Article, :count).by(1)
        end

        it "assigns a newly created article as @article" do
          post :create, params: valid_params
          expect(assigns(:article)).to be_a(Article)
          expect(assigns(:article)).to be_persisted
        end

        it "redirects to the created article" do
          post :create, params: valid_params
          expect(response).to redirect_to(Article.last)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved article as @article" do
          post :create, params: invalid_params
          expect(assigns(:article)).to be_a_new(Article)
        end

        it "re-renders the 'new' template" do
          post :create, params: invalid_params
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do

        it "assigns the requested article as @article" do
          put :update, id: article_published.id, params: { article: valid_attributes }
          expect(assigns(:article)).to eq(article_published)
        end

        it "redirects to the markdown_editor_controller" do
          put :update, id: article_published.id, params: { article: valid_attributes }
          expect(response).to redirect_to(article_published)
        end
      end

      context "with invalid params" do
        it "re-renders the 'edit' template" do
          put :update, id: article_published.id, params: { article: invalid_attributes }
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested article" do
        expect {
          delete :destroy, id: article_not_published.id
        }.to change(Article, :count).by(-1)
      end

      it "redirects to the articles list" do
        delete :destroy, id: article_not_published.id 
        expect(response).to redirect_to(articles_url)
      end
    end


  end

  context 'public participant' do
    describe 'GET #index' do
      before { get :index }
      it { expect((assigns(:articles).map(&:article)).sort).to eq ['article_published', 'participant2_article_published'].sort }
      it { expect(response).to render_template :index }
    end

    describe 'GET #show' do
      before { get :show, id: article_published.id }
      it { expect(assigns(:article)).to eq article_published }
      it { expect(response).to render_template :show }
    end

    describe 'GET #edit' do
      before { put :update, id: participant2_not_published.id }
      it { denies_access }
    end
  end

  context 'article author' do
    # TBD
  end

end
