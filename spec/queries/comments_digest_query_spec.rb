require 'rails_helper'

RSpec.describe CommentsDigestQuery do
  let!(:participant) { create :participant }
  let!(:challenge) { create :challenge }
  let!(:topic) { create :topic, challenge: challenge }
  let!(:comment) { create :comment, topic: topic, participant: participant }
  let!(:email_preference) { create :email_preference, participant: participant }

  describe "execute query" do
    subject(:query) { described_class.new(comment.id,start_dttm).call }

    context 'daily' do
      let(:start_dttm) { 24.hours.ago }
      it { expect(query.sort).to match_array([comment.id].sort) }
    end

    context 'weekly' do
      let(:start_dttm) { 7.days.ago }
      it { expect(query.sort).to match_array([comment.id].sort) }
    end


  end

end
