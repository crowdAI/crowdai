require 'rails_helper'

describe LeaderboardPolicy do
  subject { described_class.new(participant, leaderboard_row) }
  let(:leaderboard_row) { Leaderboard.first }

  context 'leaderboard visible' do
    let!(:challenge) { create(:challenge, :running) }
    let!(:round) { challenge.challenge_rounds.first }
    2.times do |i|
      let!("base_#{i + 1}") {
        create :base_leaderboard,
          challenge_id: challenge.id,
          challenge_round_id: round.id,
          row_num: i,
          score: 100 - i,
          score_secondary: i/100 }
    end

    context 'for a public participant' do
      let(:participant) { nil }
      it { is_expected.to permit_action(:index) }
      it { expect(Pundit.policy_scope(participant,Leaderboard)
        .pluck(:participant_id))
        .to eq(Leaderboard.all.pluck(:participant_id)) }
    end

    context 'for a participant' do
      let(:participant) { create(:participant) }
      it { is_expected.to permit_action(:index) }
      it { expect(Pundit.policy_scope(participant,Leaderboard)
        .pluck(:participant_id))
        .to eq(Leaderboard.all.pluck(:participant_id)) }
    end
  end

  context 'leaderboard not visible' do
    let!(:challenge) {
      create(:challenge, :running, show_leaderboard: false) }
    let!(:round) { challenge.challenge_rounds.first }
    2.times do |i|
      let!("base_#{i + 1}") {
        create :base_leaderboard,
          challenge_id: challenge.id,
          challenge_round_id: round.id,
          row_num: i,
          score: 100 - i,
          score_secondary: i/100 }
    end

    context 'for a public participant' do
      let(:participant) { nil }
      it { is_expected.to permit_action(:index) }
      it { expect(Pundit.policy_scope(participant,Leaderboard)).to be_empty }
    end

    context 'for a participant' do
      let(:participant) { create(:participant) }
      it { is_expected.to permit_action(:index) }
      it { expect(Pundit.policy_scope(participant,Leaderboard)).to be_empty }
    end

    context 'for an admin' do
      let(:participant) { create :participant, admin: true }
      it { expect(Pundit.policy_scope(participant,Leaderboard)
        .pluck(:participant_id))
        .to eq(Leaderboard.all.pluck(:participant_id)) }
    end

    context 'for the organizer' do
      let(:participant) { create :participant, organizer_id: challenge.organizer_id }
      it { expect(Pundit.policy_scope(participant,Leaderboard)
        .pluck(:participant_id))
        .to eq(Leaderboard.all.pluck(:participant_id)) }
    end
  end

  context 'private challenge - leaderboard visible' do
    let!(:challenge) {
      create(:challenge,
        :running,
        private_challenge: true) }
    let!(:round) { challenge.challenge_rounds.first }
    2.times do |i|
      let!("base_#{i + 1}") {
        create :base_leaderboard,
          challenge_id: challenge.id,
          challenge_round_id: round.id,
          row_num: i,
          score: 100 - i,
          score_secondary: i/100 }
    end

    context 'for a public participant' do
      let(:participant) { nil }
      it { is_expected.to permit_action(:index) }
      it { expect(Pundit.policy_scope(participant,Leaderboard)).to be_empty }
    end

    context 'for a participant' do
      let(:participant) { create(:participant) }
      it { is_expected.to permit_action(:index) }
      it { expect(Pundit.policy_scope(participant,Leaderboard)).to be_empty }
    end

    context 'for a private participant' do
      let!(:participant) { create(:participant) }
      let!(:invitation) {
        create(:invitation,
          challenge_id: challenge.id,
          participant_id: participant.id,
          email: participant.email) }
      it { is_expected.to permit_action(:index) }
      it { expect(Pundit.policy_scope(participant,Leaderboard)
        .pluck(:participant_id))
        .to eq(Leaderboard.all.pluck(:participant_id)) }
    end

    context 'for an admin' do
      let(:participant) { create :participant, admin: true }
      it { expect(Pundit.policy_scope(participant,Leaderboard)
        .pluck(:participant_id))
        .to eq(Leaderboard.all.pluck(:participant_id)) }
    end

    context 'for the organizer' do
      let(:participant) { create :participant, organizer_id: challenge.organizer_id }
      it { expect(Pundit.policy_scope(participant,Leaderboard)
        .pluck(:participant_id))
        .to eq(Leaderboard.all.pluck(:participant_id)) }
    end
  end

  context 'private challenge - leaderboard not visible' do
    let!(:challenge) {
      create(:challenge,
        :running,
        private_challenge: true,
        show_leaderboard: false) }
    let!(:round) { challenge.challenge_rounds.first }
    2.times do |i|
      let!("base_#{i + 1}") {
        create :base_leaderboard,
          challenge_id: challenge.id,
          challenge_round_id: round.id,
          row_num: i,
          score: 100 - i,
          score_secondary: i/100 }
    end

    context 'for a public participant' do
      let(:participant) { nil }
      it { is_expected.to permit_action(:index) }
      it { expect(Pundit.policy_scope(participant,Leaderboard)).to be_empty }
    end

    context 'for a participant' do
      let(:participant) { create(:participant) }
      it { is_expected.to permit_action(:index) }
      it { expect(Pundit.policy_scope(participant,Leaderboard)).to be_empty }
    end

    context 'for a private participant' do
      let!(:participant) { create(:participant) }
      let!(:invitation) {
        create(:invitation,
          challenge_id: challenge.id,
          participant_id: participant.id,
          email: participant.email) }
      it { is_expected.to permit_action(:index) }
      it { expect(Pundit.policy_scope(participant,Leaderboard)).to be_empty }
    end

    context 'for an admin' do
      let(:participant) { create :participant, admin: true }
      it { expect(Pundit.policy_scope(participant,Leaderboard)
        .pluck(:participant_id))
        .to eq(Leaderboard.all.pluck(:participant_id)) }
    end

    context 'for the organizer' do
      let(:participant) { create :participant, organizer_id: challenge.organizer_id }
      it { expect(Pundit.policy_scope(participant,Leaderboard)
        .pluck(:participant_id))
        .to eq(Leaderboard.all.pluck(:participant_id)) }
    end
  end

end
