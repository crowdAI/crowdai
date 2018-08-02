require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  let(:participant) { create :participant }
  let(:published_article) {
    FactoryBot.attributes_for(
      :article,
      participant_id: participant.id,
      published: true)
  }
  let(:unpublished_article) {
    FactoryBot.attributes_for(
      :article,
      participant_id: participant.id,
      published: false)
  }

  before do
    sign_in participant
  end

  describe 'bronze' do
    context 'badge not awarded' do
      before { post :create, params: { article: unpublished_article } }
      it { expect(participant.badges.count).to eq(0) }
    end

    context 'badge awarded' do
      before { post :create, params: { article: published_article } }
      it { expect(participant.badges.count).to eq(1) }
      it { expect(participant.badges.first.name).to eq('tutorial-bronze') }
    end
  end

  describe 'silver' do
    context 'badge not awarded' do
      before do
        2.times do
          post :create, params: { article: published_article }
        end
        post :create, params: { article: unpublished_article }
      end
      it { expect(participant.badges.select{|b| b.name == 'tutorial-bronze'}.count).to eq(1) }
      it { expect(participant.badges.select{|b| b.name == 'tutorial-silver'}.count).to eq(0) }
    end

    context 'badge awarded' do
      before do
        3.times do
          post :create, params: { article: published_article }
        end
      end
      it { expect(participant.badges.select{|b| b.name == 'tutorial-bronze'}.count).to eq(1) }
      it { expect(participant.badges.select{|b| b.name == 'tutorial-silver'}.count).to eq(1) }
    end
  end

  describe 'gold' do
    context 'badge not awarded' do
      before do
        29.times do
          post :create, params: { article: published_article }
        end
        post :create, params: { article: unpublished_article }
      end
      it { expect(participant.badges.select{|b| b.name == 'tutorial-bronze'}.count).to eq(1) }
      it { expect(participant.badges.select{|b| b.name == 'tutorial-silver'}.count).to eq(1) }
      it { expect(participant.badges.select{|b| b.name == 'tutorial-gold'}.count).to eq(0) }
    end

    context 'badge awarded' do
      before do
        30.times do
          post :create, params: { article: published_article }
        end
        post :create, params: { article: unpublished_article }
      end
      it { expect(participant.badges.select{|b| b.name == 'tutorial-bronze'}.count).to eq(1) }
      it { expect(participant.badges.select{|b| b.name == 'tutorial-silver'}.count).to eq(1) }
      it { expect(participant.badges.select{|b| b.name == 'tutorial-gold'}.count).to eq(1) }
    end
  end

end
