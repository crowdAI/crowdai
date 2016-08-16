require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:author) { create(:participant) }
  let(:admin) { create(:participant, :admin )}
  let(:article) { create(:article, :with_sections, participant: author) }
  let(:unpublished_article) { create(:article, :with_sections, participant: author, published: false) }

  context 'a public user' do
    describe 'articles#index' do
      before { get :index }
      it { expect(response).to render_template 'index' }
    end
    describe 'articles#show for published article' do
      before { get :show, id: article.id }
      it { expect(response).to render_template 'show'}
    end
  
  end

  context 'the article author' do
  end

  context "an admin user" do
  end

  
  describe 'GET new' do
    it 'works' do
      get :new, {}, {}
      expect(response.status).to eq(200)
    end
  end

  
  describe 'GET edit' do
    it 'works' do
      get :edit, {}, {}
      expect(response.status).to eq(200)
    end
  end

  
  describe 'PUT update' do
    it 'works' do
      put :update, {}, {}
      expect(response.status).to eq(200)
    end
  end

  
  describe 'DELETE destroy' do
    it 'works' do
      delete :destroy, {}, {}
      expect(response.status).to eq(200)
    end
  end


end
