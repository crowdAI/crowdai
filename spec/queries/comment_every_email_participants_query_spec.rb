require 'rails_helper'

RSpec.describe CommentEveryEmailParticipantsQuery do

  context 'receive every email AND has made a comment in the thread' do
    let!(:participant1) { create :participant }
    let!(:participant2) { create :participant }
    let!(:email_preference1) { create :email_preference, :every_email, participant: participant1 }
    let!(:email_preference2) { create :email_preference, :every_email, participant: participant2 }
    let!(:challenge) { create :challenge }
    let!(:topic) { create :topic, challenge: challenge, participant: participant2 }
    let!(:comment) { create :comment, topic: topic, participant: participant2 }
    let!(:comment2) { create :comment, topic: topic, participant: participant1 }

    subject(:query) { described_class.new(comment.id).call }
    it { expect(query.sort).to match_array([participant1.id,participant2.id].sort) }
  end

  context 'receive every email AND has not made a comment in the thread' do
    let!(:participant1) { create :participant }
    let!(:participant2) { create :participant }
    let!(:email_preference1) { create :email_preference, :every_email, participant: participant1 }
    let!(:email_preference2) { create :email_preference, :every_email, participant: participant2 }
    let!(:challenge) { create :challenge }
    let!(:topic) { create :topic, challenge: challenge, participant: participant2 }
    let!(:comment) { create :comment, topic: topic, participant: participant1 }
    let!(:comment2) { create :comment, topic: topic, participant: participant1 }

    subject(:query) { described_class.new(comment.id).call }
    it { expect(query.sort).to match_array([participant1.id].sort) }
  end

  context 'receive every email AND has hearted the challenge' do
    let!(:participant1) { create :participant }
    let!(:participant2) { create :participant }
    let!(:email_preference1) { create :email_preference, :every_email, participant: participant1 }
    let!(:email_preference2) { create :email_preference, :every_email, participant: participant2 }
    let!(:vote) { create :vote, participant: participant1 }
    let!(:topic) { create :topic, challenge_id: vote.votable_id, participant: participant2 }
    let!(:comment) { create :comment, topic: topic, participant: participant1 }
    let!(:comment2) { create :comment, topic: topic, participant: participant1 }

    subject(:query) { described_class.new(comment.id).call }
    it { expect(query.sort).to match_array([participant1.id,participant2.id].sort) }
  end


=begin
  context 'receive every email AND has hearted the challenge' do
    let!(:participant) { create :participant }
    let!(:email_preference) { create :email_preference, :every_email, participant: participant }
    let!(:challenge) { create :challenge }
    let!(:topic) { create :topic, challenge: challenge }
    let!(:comment) { create :comment, topic: topic }
    let!(:comment2) { create :comment, topic: topic, participant: participant }
    subject(:query) { described_class.new(comment.id).call }
    it { expect(query.sort).to match_array([participant.id].sort) }
  end

  context 'receive every email AND has not hearted the challenge' do
    let!(:participant) { create :participant }
    let!(:email_preference) { create :email_preference, :every_email, participant: participant }
    let!(:challenge) { create :challenge }
    let!(:topic) { create :topic, challenge: challenge }
    let!(:comment) { create :comment, topic: topic }
    let!(:comment2) { create :comment, topic: topic, participant: participant }
    subject(:query) { described_class.new(comment.id).call }
    it { expect(query.sort).to match_array([participant.id].sort) }
  end

  context 'NOT receive every email AND has made a comment in the thread' do
    let!(:participant) { create :participant }
    let!(:email_preference) { create :email_preference, :daily, participant: participant }
    let!(:challenge) { create :challenge }
    let!(:topic) { create :topic, challenge: challenge }
    let!(:comment) { create :comment, topic: topic }
    let!(:comment2) { create :comment, topic: topic, participant: participant }
    subject(:query) { described_class.new(comment.id).call }
    it { expect(query.sort).to match_array([participant.id].sort) }
  end

  context 'NOT receive every email AND has not made a comment in the thread' do
    let!(:participant) { create :participant }
    let!(:email_preference) { create :email_preference, :daily, participant: participant }
    let!(:challenge) { create :challenge }
    let!(:topic) { create :topic, challenge: challenge }
    let!(:comment) { create :comment, topic: topic }
    let!(:comment2) { create :comment, topic: topic, participant: participant }
    subject(:query) { described_class.new(comment.id).call }
    it { expect(query.sort).to match_array([participant.id].sort) }
  end

  context 'NOT receive every email AND has hearted the challenge' do
    let!(:participant) { create :participant }
    let!(:email_preference) { create :email_preference, :daily, participant: participant }
    let!(:challenge) { create :challenge }
    let!(:topic) { create :topic, challenge: challenge }
    let!(:comment) { create :comment, topic: topic }
    let!(:comment2) { create :comment, topic: topic, participant: participant }
    subject(:query) { described_class.new(comment.id).call }
    it { expect(query.sort).to match_array([participant.id].sort) }
  end

  context 'NOT receive every email AND has not hearted the challenge' do
    let!(:participant) { create :participant }
    let!(:email_preference) { create :email_preference, :daily, participant: participant }
    let!(:challenge) { create :challenge }
    let!(:topic) { create :topic, challenge: challenge }
    let!(:comment) { create :comment, topic: topic }
    let!(:comment2) { create :comment, topic: topic, participant: participant }
    subject(:query) { described_class.new(comment.id).call }
    it { expect(query.sort).to match_array([participant.id].sort) }
    it { puts Participant.inspect }
  end




  let!(:participant) { create :participant }
  let!(:email_preference) { create :email_preference, participant: participant }



  let!(:challenge) { create :challenge }
  let!(:topic) { create :topic, challenge: challenge }
  let!(:comment) { create :comment, topic: topic, participant: participant }

  describe "execute query" do
    subject(:query) { described_class.new(comment.id).call }
    it { expect(query.sort).to match_array([participant.id].sort) }
  end
=end

end
