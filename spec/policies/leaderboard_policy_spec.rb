require 'rails_helper'

describe LeaderboardPolicy do
  subject { described_class.new(participant, leaderboard) }

  let(:challenge) { create(:challenge)}
  3.times do |i|
    let!("submission_#{i + 1}") { create :submission }
  end
  let(:leaderboard) { Leaderboard.where(challenge_id: challenge.id).first }

  context 'for a public participant' do
    let(:participant) { nil }
    it { is_expected.to forbid_action(:show) }
    it { is_expected.to permit_action(:index) }
    it { is_expected.to forbid_action(:create) }
    it { is_expected.to forbid_action(:new) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:destroy) }
    it { is_expected.to permit_action(:host) }
  end

  context 'for a participant' do
    let(:participant) { create(:participant) }
    it { is_expected.to forbid_action(:show) }
    it { is_expected.to permit_action(:index) }
    it { is_expected.to forbid_action(:create) }
    it { is_expected.to forbid_action(:new) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:destroy) }
    it { is_expected.to permit_action(:host) }
  end

end
