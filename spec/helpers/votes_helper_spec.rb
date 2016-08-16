# -*- encoding: utf-8 -*-

require 'rails_helper'

describe VotesHelper do

  
  describe '#vote_link' do
    it 'works' do
      result = vote_link(votable)
      expect(result).not_to be_nil
    end
  end

  
  describe '#upvote_link' do
    it 'works' do
      result = upvote_link(votable)
      expect(result).not_to be_nil
    end
  end

  
  describe '#downvote_link' do
    it 'works' do
      result = downvote_link(votable, vote_id)
      expect(result).not_to be_nil
    end
  end

  
  describe '#participant_vote_id' do
    it 'works' do
      result = participant_vote_id(votable)
      expect(result).not_to be_nil
    end
  end

  
  describe '#create_vote_path' do
    it 'works' do
      result = create_vote_path(votable)
      expect(result).not_to be_nil
    end
  end

  
  describe '#destroy_vote_path' do
    it 'works' do
      result = destroy_vote_path(votable, vote_id)
      expect(result).not_to be_nil
    end
  end

end
