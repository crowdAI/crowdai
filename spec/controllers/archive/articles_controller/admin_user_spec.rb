require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let!(:article) { create :article, :with_sections }
  let!(:other_article) { create :article, article: 'other' }
  let!(:admin) { create :participant, :admin }

  context 'admin user' do
    before { sign_in admin }

    describe 'GET #index' do
      before { get :index }
      it "assigns all articles" do
        expect(assigns(:articles)).to eq([article,other_article])
      end
      it { expect(response).to render_template :index }
    end

    describe 'GET #show' do
      before { get :show, id: other_article.to_param }
      it "assigns for an article" do
        expect(assigns(:article)).to eq(other_article)
      end
      it { expect(response).to render_template :show }
    end

    describe 'GET #new' do
      before { get :new }
      it "assigns @article" do
        expect(assigns(:article)).to be_a_new(Article)
      end
      it { expect(response).to render_template :new }
    end

    describe 'GET #edit' do
      before { get :edit, id: article.to_param }
      it "assigns for the admin article" do
        expect(assigns(:article)).to eq(article)
      end
      it { expect(response).to render_template :edit }
    end

=begin
    describe 'POST #create' do
      context 'with valid attributes' do
        it "saves the new record in the database" do
          expect {
            post :create, article: attributes_for(:article)
          }.to change(Article, :count).by(1)
        end
        it "redirects to the new record" do
          post :create, article: attributes_for(:article)
          expect(response).to redirect_to article_url(assigns[:article].to_param)
        end
      end

      context 'with invalid attributes' do
        it "does not save the new record in the database" do
          expect {
            post :create, article: attributes_for(:article, :invalid)
          }.not_to change(Article, :count)
        end
        it "re-renders the :new template" do
          post :create, article: attributes_for(:article, :invalid)
          expect(response).to render_template :new
        end
      end
    end
=end
    describe 'PATCH #update' do
      context 'for allowed article with valid attributes' do
        before { patch :update, id: article.to_param, article: { article: 'changed' } }
        it "assigns the requested @article" do
          expect(assigns(:article)).to eq(article)
        end
        it "updates the record" do
          article.reload
          expect(assigns(:article)[:article]).to eq('changed')
        end
        it "redirects to updated record" do
          expect(response).to redirect_to '/articles/changed'
        end
      end

      context 'for allowed article with invalid attributes' do
        before { patch :update, id: article.to_param, article: attributes_for(:article, :invalid) }
        it "does not change the attributes" do
          expect(assigns(:article)).to eq(article)
        end
        it { expect(response).to render_template :edit }
      end
    end

    describe 'DELETE #destroy' do
      it "deletes the record" do
        expect {
          delete :destroy, id: article.to_param
        }.to change(Article, :count).by(-1)
      end
      it "redirects to index" do
        delete :destroy, id: other_article.to_param
        expect(response).to redirect_to articles_url
        expect(controller).to set_flash[:notice].to("Article was successfully deleted.")
      end
    end

  end
end
