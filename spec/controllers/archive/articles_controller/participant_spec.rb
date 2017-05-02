require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let!(:article) { create :article, :with_sections }
  let!(:unpublished_article) { create :article, :unpublished }
  let!(:participant) { create :participant }

  context 'participant user' do
    before { sign_in participant }

    describe 'GET #index' do
      before { get :index }
      it "assigns all articles" do
        expect(assigns(:articles)).to eq([article])
      end
      it { expect(response).to render_template :index }
    end

    describe 'GET #show' do
      before { get :show, id: article.to_param }
      it "assigns for an article" do
        expect(assigns(:article)).to eq(article)
      end
      it { expect(response).to render_template :show }
    end

    describe 'redirect GET #new' do
      before { get :new }
      it { expect(response).to redirect_to root_path }
      #it { expect(controller).to set_flash[:error].to("You are not authorised for this action") }
    end

    describe 'redirect GET #edit' do
      before { get :edit, id: article.to_param }
      it { expect(response).to redirect_to root_path }
      it { expect(controller).to set_flash[:error].to("You are not authorised for this action") }
    end

    describe 'redirect POST #create' do
      before { post :create, article: attributes_for(:article) }
      it { expect(response).to redirect_to root_path }
      it { expect(controller).to set_flash[:error].to("You are not authorised for this action") }
    end

    describe 'redirect PATCH #update' do
      before { patch :update, id: article.to_param, article: { article: 'changed' } }
      it { expect(response).to redirect_to root_path }
      it { expect(controller).to set_flash[:error].to("You are not authorised for this action") }
    end

    describe 'redirect DELETE #destroy' do
      before { delete :destroy, id: article.to_param }
      it { expect(response).to redirect_to root_path }
      it { expect(controller).to set_flash[:error].to("You are not authorised for this action") }
    end

  end
end
