require 'rails_helper'

RSpec.describe TopicEveryEmailParticipantsQuery do

  describe 'receive every email' do
    context 'receive every email AND has hearted the challenge' do
      let!(:author) { create :participant }
      let!(:follower) { create :participant }
      let!(:email_preference1) {
        create :email_preference,
        email_frequency: :every,
        participant: author }
      let!(:email_preference2) {
        create :email_preference,
        email_frequency: :every,
        participant: follower }
      let!(:follow) { create :follow, participant: follower }
      let!(:topic) {
        create :topic,
        challenge_id: follow.followable_id,
        participant: author }

      subject(:query) { described_class.new(topic.id).call }
      it { expect(query.sort).to match_array([follower.id].sort) }
    end
  end

  describe 'does not receive every email' do
    context 'receive daily digest AND has hearted the challenge' do
      let!(:author) { create :participant }
      let!(:follower) { create :participant }
      let!(:email_preference1) {
        create :email_preference,
        email_frequency: :daily,
        participant: author }
      let!(:email_preference2) {
        create :email_preference,
        email_frequency: :daily,
        participant: follower }
      let!(:follow) { create :follow, participant: follower }
      let!(:topic) {
        create :topic,
        challenge_id: follow.followable_id,
        participant: author }

      subject(:query) { described_class.new(topic.id).call }
      it { expect(query.sort).to match_array([]) }
    end

    context 'receive weekly digest AND has hearted the challenge' do
      let!(:author) { create :participant }
      let!(:follower) { create :participant }
      let!(:email_preference1) {
        create :email_preference,
        email_frequency: :weekly,
        participant: author }
      let!(:email_preference2) {
        create :email_preference,
        email_frequency: :weekly,
        participant: follower }
      let!(:follow) { create :follow, participant: follower }
      let!(:topic) {
        create :topic,
        challenge_id: follow.followable_id,
        participant: author }

      subject(:query) { described_class.new(topic.id).call }
      it { expect(query.sort).to match_array([]) }
    end
  end

end
