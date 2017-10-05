require 'rails_helper'

RSpec.describe CommentsDigestQuery do
  let!(:participant) { create :participant }
  let!(:challenge) { create :challenge }
  let!(:topic) { create :topic, challenge: challenge }
  let!(:comment1) { topic.comments.first }
  let!(:comment2) { create :comment, topic: topic, participant: participant }

  let!(:email_preference) { create :email_preference, participant: participant }

  describe "execute query" do
    subject(:query) { described_class.new(participant,start_dttm).call }

    context 'daily' do
      let(:start_dttm) { 24.hours.ago }
      it { expect(subject.sort).to match_array([comment1.id,comment2.id].sort) }
    end

    context 'weekly' do
      let(:start_dttm) { 7.days.ago }
      it { expect(subject.sort).to match_array([comment1.id,comment2.id].sort) }
    end

    context 'NullParticipant comment is excluded' do
      let(:start_dttm) { 7.days.ago }
      let(:comment3) { create :comment, topic: topic, participant: nil }
      it { expect(subject.sort).to match_array([comment1.id,comment2.id].sort) }
    end

    context 'Participant follows' do

    end

  end

end
