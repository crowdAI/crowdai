require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  let!(:participant) { create :participant }
  let!(:participant2) { create :participant }
  let!(:article_published) { create :article, article: 'article_published', participant: participant, published: true}
  let!(:article_not_published) { create :article, article: 'article_not_published', participant: participant, published: false}
  let!(:participant2_article_published) { create :article, article: 'participant2_article_published', participant: participant2, published: true}
  let!(:participant2_not_published) { create :article, article: 'participant2_not_published', participant: participant2, published: false}

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

    describe 'GET #show' do
      before { get :show, id: participant2_not_published.id }
      it { denies_access }
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

    describe 'GET #show' do
      before { get :show, id: participant2_not_published.id }
      it { denies_access }
    end

  end

  context 'article author' do
    # TBD
  end

end
