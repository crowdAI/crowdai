require 'rails_helper'

RSpec.describe CommentParticipantsQuery do
  let!(:participant) { create :participant }
  let!(:challenge) { create :challenge }
  let!(:topic) { create :topic, challenge: challenge }
  let!(:comment) { create :comment, topic: topic, participant: participant }
  let!(:email_preference) { create :email_preference, participant: participant }

  describe "execute query" do
    subject(:query) { described_class.new(comment.id).call }
    it { expect(query.sort).to match_array([participant.id].sort) }
  end

end
