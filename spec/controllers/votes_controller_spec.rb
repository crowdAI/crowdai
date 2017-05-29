require 'rails_helper'
=begin
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
        post challenge_votes_path(challenge), xhr: true
      end
      it "registers the vote" do
        #expect { register_vote }.to change { Vote.count }.by(1) }
        #expect { register_vote }.to change { challenge.vote_count }.by(1) }
      end
    end

    describe "POST #create for Article" do
      def register_vote
        post :create, xhr: true, article_id: article.id
      end
      it "registers the vote" do
        register_vote
        expect(Vote.count).to change by(1)
        #expect { register_vote }.to change { article.vote_count }.by(1) }
      end
    end

    describe "POST #create for Topic" do
      def register_vote
        post challenge_votes_path(challenge), xhr: true
      end
      it "registers the vote" do
        #expect { register_vote }.to change { Topic.count }.by(1) }
        #expect { register_vote }.to change { topic.vote_count }.by(1) }
      end
    end

  end

  context 'anonymous' do

  end

end
=end
