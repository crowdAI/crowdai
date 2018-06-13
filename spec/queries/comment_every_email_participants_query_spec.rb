require 'rails_helper'

RSpec.describe CommentEveryEmailParticipantsQuery do

  describe 'receive every email' do
    context 'receive every email AND has made a comment in the thread' do
      let!(:participant1) { create :participant }
      let!(:participant2) { create :participant }
      let!(:email_preference1) {
        create :email_preference,
        email_frequency: :every,
        participant: participant1 }
      let!(:email_preference2) {
        create :email_preference,
        email_frequency: :every,
        participant: participant2 }
      let!(:challenge) { create :challenge }
      let!(:topic) {
        create :topic,
        challenge: challenge,
        participant: participant2 }
      let!(:comment) {
        create :comment,
        topic: topic,
        participant: participant2 }
      let!(:comment2) {
        create :comment,
        topic: topic,
        participant: participant1 }

      subject(:query) { described_class.new(comment.id).call }
      it { expect(query.sort).to match_array([participant1.id,participant2.id].sort) }
    end

    context 'receive every email AND has not made a comment in the thread' do
      let!(:participant1) { create :participant }
      let!(:participant2) { create :participant }
      let!(:email_preference1) {
        create :email_preference,
        email_frequency: :every,
        participant: participant1 }
      let!(:email_preference2) {
        create :email_preference,
        email_frequency: :every,
        participant: participant2 }
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
      let!(:email_preference1) {
        create :email_preference,
        email_frequency: :every,
        participant: participant1 }
      let!(:email_preference2) {
        create :email_preference,
        email_frequency: :every,
        participant: participant2 }
      let!(:follow) { create :follow, participant: participant2 }
      let!(:topic) { create :topic, challenge_id: follow.followable_id, participant: participant1 }
      let!(:comment) { create :comment, topic: topic, participant: participant1 }
      let!(:comment2) { create :comment, topic: topic, participant: participant1 }

      subject(:query) { described_class.new(comment.id).call }
      it { expect(query.sort).to match_array([participant1.id,participant2.id].sort) }
    end

    context 'receive every email AND HAS NOT hearted the challenge' do
      let!(:participant1) { create :participant }
      let!(:participant2) { create :participant }
      let!(:email_preference1) {
        create :email_preference,
        email_frequency: :every,
        participant: participant1 }
      let!(:email_preference2) {
        create :email_preference,
        email_frequency: :every,
        participant: participant2 }
      let!(:challenge) { create :challenge }
      let!(:topic) { create :topic, challenge_id: challenge.id, participant: participant1 }
      let!(:comment) { create :comment, topic: topic, participant: participant1 }
      let!(:comment2) { create :comment, topic: topic, participant: participant1 }

      subject(:query) { described_class.new(comment.id).call }
      it { expect(query.sort).to match_array([participant1.id].sort) }
    end
  end

  describe 'does not receive every email' do
    context 'receive daily digest AND has made a comment in the thread' do
      let!(:participant1) { create :participant }
      let!(:participant2) { create :participant }
      let!(:email_preference1) {
        create :email_preference,
        email_frequency: :daily,
        participant: participant1 }
      let!(:email_preference2) {
        create :email_preference,
        email_frequency: :daily,
        participant: participant2 }
      let!(:challenge) { create :challenge }
      let!(:topic) { create :topic, challenge: challenge, participant: participant2 }
      let!(:comment) { create :comment, topic: topic, participant: participant2 }
      let!(:comment2) { create :comment, topic: topic, participant: participant1 }

      subject(:query) { described_class.new(comment.id).call }
      it { expect(query.sort).to match_array([]) }
    end

    context 'receive daily digest AND has not made a comment in the thread' do
      let!(:participant1) { create :participant }
      let!(:participant2) { create :participant }
      let!(:email_preference1) {
        create :email_preference,
        email_frequency: :daily,
        participant: participant1 }
      let!(:email_preference2) {
        create :email_preference,
        email_frequency: :daily,
        participant: participant2 }
      let!(:challenge) { create :challenge }
      let!(:topic) { create :topic, challenge: challenge, participant: participant2 }
      let!(:comment) { create :comment, topic: topic, participant: participant1 }
      let!(:comment2) { create :comment, topic: topic, participant: participant1 }

      subject(:query) { described_class.new(comment.id).call }
      it { expect(query.sort).to match_array([]) }
    end

    context 'receive daily digest AND has hearted the challenge' do
      let!(:participant1) { create :participant }
      let!(:participant2) { create :participant }
      let!(:email_preference1) {
        create :email_preference,
        email_frequency: :daily,
        participant: participant1 }
      let!(:email_preference2) {
        create :email_preference,
        email_frequency: :daily,
        participant: participant2 }
      let!(:follow) { create :follow, participant: participant2 }
      let!(:topic) { create :topic, challenge_id: follow.followable_id, participant: participant1 }
      let!(:comment) { create :comment, topic: topic, participant: participant1 }
      let!(:comment2) { create :comment, topic: topic, participant: participant1 }

      subject(:query) { described_class.new(comment.id).call }
      it { expect(query.sort).to match_array([]) }
    end

    context 'receive daily digest AND HAS NOT hearted the challenge' do
      let!(:participant1) { create :participant }
      let!(:participant2) { create :participant }
      let!(:email_preference1) {
        create :email_preference,
        email_frequency: :daily,
        participant: participant1 }
      let!(:email_preference2) {
        create :email_preference,
        email_frequency: :daily,
        participant: participant2 }
      let!(:challenge) { create :challenge }
      let!(:topic) { create :topic, challenge_id: challenge.id, participant: participant1 }
      let!(:comment) { create :comment, topic: topic, participant: participant1 }
      let!(:comment2) { create :comment, topic: topic, participant: participant1 }

      subject(:query) { described_class.new(comment.id).call }
      it { expect(query.sort).to match_array([]) }
    end
  end

end
