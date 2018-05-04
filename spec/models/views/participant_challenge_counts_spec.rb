=begin
require 'rails_helper'

describe ParticipantChallengeCount, type: :model do
  context 'fields' do
    it { is_expected.to respond_to :challenge_id }
    it { is_expected.to respond_to :participant_id }
    it { is_expected.to respond_to :registration_type }
  end

  context 'associations' do
    it { is_expected.to belong_to :challenge }
    it { is_expected.to belong_to :participant }
  end

  context 'view SQL' do
    let!(:participant1) { create :participant }
    let!(:participant2) { create :participant }
    let!(:challenge) { create :challenge }
    let!(:vote1) { create :vote, votable: challenge, participant: participant1 }
    let!(:vote2) { create :vote, votable: challenge, participant: participant2 }
    let!(:submission) { create :submission, challenge: challenge, participant: participant2 }
    let!(:topic) { create :topic, participant: participant2 }

    3.times do |i|
      let!("challenge_#{i + 1}") { create :challenge }
    end

    it { expect(ParticipantChallengeCount.count).to eq(5) }
    it { expect(ParticipantChallengeCount
                  .where(participant: participant1)
                  .pluck(:registration_type).sort).to eq ['heart'] }
    it { expect(ParticipantChallengeCount
                  .where(participant: participant2)
                  .pluck(:registration_type).sort).to eq ['forum','heart','submission'] }
  end
end
=end
