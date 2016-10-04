require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let!(:participant) { create :participant }
  let!(:article) { create :article, :with_sections, participant_id: participant.id }
  let!(:other_article) { create :article, :with_sections }
  let!(:unpublished_article) { create :article, :unpublished }

  context 'article author user' do
    before { sign_in participant }

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

    describe 'redirect GET #new' do
      before { get :new }
      it { expect(response).to redirect_to root_path }
      it { expect(controller).to set_flash[:error].to("You are not authorised for this action") }
    end


    describe 'GET #edit' do
      before { get :edit, id: article.to_param }
      it "assigns for the admin article" do
        expect(assigns(:article)).to eq(article)
      end
      it { expect(response).to render_template :edit }
    end

    describe 'redirect POST #create' do
      before { post :create, article: attributes_for(:article) }
      it { expect(response).to redirect_to root_path }
      #it { expect(controller).to set_flash[:error].to("You are not authorised for this action") }
    end


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
          expect(response).to redirect_to article
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

    describe 'redirect DELETE #destroy' do
      before { delete :destroy, id: article.to_param }
      it { expect(response).to redirect_to root_path }
      it { expect(controller).to set_flash[:error].to("You are not authorised for this action") }
    end

  end
end
