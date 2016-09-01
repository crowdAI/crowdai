# -*- encoding: utf-8 -*-

require 'rails_helper'

describe VotesHelper do
  let!(:participant) { create :participant }
  let!(:other_participant) { create :participant }
  let!(:article) { create :article, :with_sections, participant_id: other_participant.id }


  describe 'article vote count' do
    context 'participant has voted' do
      before do
        allow(helper).to receive(:current_participant) { participant }
        article.votes.create!(participant_id: participant.id)
      end
      it { expect(article.votes.count).to eq(1) }
      it { expect(helper.participant_vote_id(article)).to eq(article.votes.first.id) }
    end

    context 'participant has not voted' do
      before do
        allow(helper).to receive(:current_participant) { participant }
        article.votes.create!(participant_id: other_participant.id)
      end
      it { expect(article.votes.count).to eq(1) }
      it { expect(helper.participant_vote_id(article)).to eq(nil) }
    end
  end


end
