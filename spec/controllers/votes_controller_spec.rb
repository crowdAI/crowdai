require 'rails_helper'

RSpec.describe VotesController, type: :controller do

  let!(:challenge) { create :challenge, :running }
  let!(:article) { create :article }
  let!(:topic) { create :topic }
  let!(:participant) { create :participant }

  context 'participant' do
    before do
      sign_in participant
    end

    describe "POST #create for Challenge" do
      def register_vote
        post :create, challenge_id: challenge.id
        challenge.reload
      end
      it { expect { register_vote }.to change { Vote.count }.by(1) }
      it { expect { register_vote }.to change { challenge.vote_count }.by(1) }
    end

    describe "POST #create for Article" do
      def register_vote
        post :create, article_id: article.id
        article.reload
      end
      it { expect { register_vote }.to change { Vote.count }.by(1) }
      it { expect { register_vote }.to change { article.vote_count }.by(1) }
    end

    describe "POST #create for Topic" do
      def register_vote
        post :create, topic_id: topic.id
        topic.reload
      end
      it { expect { register_vote }.to change { Vote.count }.by(1) }
      it { expect { register_vote }.to change { topic.vote_count }.by(1) }
    end

  end

end
