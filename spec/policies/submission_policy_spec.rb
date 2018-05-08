require 'rails_helper'

describe SubmissionPolicy do
  subject { described_class.new(participant, submission) }
  let(:submission) { s1 }

  context 'challenge running' do
    let!(:challenge) {
      create(:challenge, :running) }
    let!(:round) { challenge.challenge_rounds.first }
    let!(:p1) { create :participant }
    let!(:p2) { create :participant }
    let!(:s1) { create :submission,
        challenge_id: challenge.id,
        challenge_round_id: round.id,
        participant_id: p1.id }
    let!(:s2) { create :submission,
        challenge_id: challenge.id,
        challenge_round_id: round.id,
        participant_id: p2.id }

    context 'for a public participant' do
      let(:participant) { nil }
      #it { is_expected.to permit_action(:index) }
      it { expect(Pundit.policy_scope(participant,Submission)).to be_empty }
    end

    context 'for any participant' do
      let(:participant) { create(:participant) }
      #it { is_expected.to permit_action(:index) }
      it { expect(Pundit.policy_scope(participant,Submission)).to be_empty }
    end

    context 'for the participant' do
      let(:participant) { p1 }
      #it { is_expected.to permit_action(:index) }
      it { expect(Pundit.policy_scope(participant,Submission)).to eq([s1]) }
    end

    context 'for an admin' do
      let(:participant) { create :participant, admin: true }
      it { expect(Pundit.policy_scope(participant,Submission).sort)
        .to eq(Submission.all.sort) }
    end

    context 'for the organizer' do
      let(:participant) { create :participant, organizer_id: challenge.organizer_id }
      it { expect(Pundit.policy_scope(participant,Submission).sort)
        .to eq(Submission.all.sort) }
    end
  end

  context 'challenge completed' do
    let!(:challenge) {
      create(:challenge, :completed) }
    let!(:round) { challenge.challenge_rounds.first }
    let!(:p1) { create :participant }
    let!(:p2) { create :participant }
    let!(:s1) { create :submission,
        challenge_id: challenge.id,
        challenge_round_id: round.id,
        participant_id: p1.id }
    let!(:s2) { create :submission,
        challenge_id: challenge.id,
        challenge_round_id: round.id,
        participant_id: p2.id }

    context 'for a public participant' do
      let(:participant) { nil }
      #it { is_expected.to permit_action(:index) }
      it { expect(Pundit.policy_scope(participant,Submission).sort)
        .to eq(Submission.all.sort) }
    end

    context 'for any participant' do
      let(:participant) { create(:participant) }
      #it { is_expected.to permit_action(:index) }
      it { expect(Pundit.policy_scope(participant,Submission).sort)
        .to eq(Submission.all.sort) }
    end

    context 'for the participant' do
      let(:participant) { p1 }
      #it { is_expected.to permit_action(:index) }
      it { expect(Pundit.policy_scope(participant,Submission).sort)
        .to eq(Submission.all.sort) }
    end

    context 'for an admin' do
      let(:participant) { create :participant, admin: true }
      it { expect(Pundit.policy_scope(participant,Submission).sort)
        .to eq(Submission.all.sort) }
    end

    context 'for the organizer' do
      let(:participant) { create :participant, organizer_id: challenge.organizer_id }
      it { expect(Pundit.policy_scope(participant,Submission).sort)
        .to eq(Submission.all.sort) }
    end
  end

  context 'private challenge running' do
    let!(:challenge) {
      create(:challenge,
        :running,
        private_challenge: true ) }
    let!(:round) { challenge.challenge_rounds.first }
    let!(:p1) { create :participant }
    let!(:i1) { create(:invitation,
        challenge_id: challenge.id,
        participant_id: p1.id,
        email: p1.email) }
    let!(:p2) { create :participant }
    let!(:i2) { create(:invitation,
        challenge_id: challenge.id,
        participant_id: p2.id,
        email: p2.email) }
    let!(:s1) { create :submission,
        challenge_id: challenge.id,
        challenge_round_id: round.id,
        participant_id: p1.id }
    let!(:s2) { create :submission,
        challenge_id: challenge.id,
        challenge_round_id: round.id,
        participant_id: p2.id }

    context 'for a public participant' do
      let(:participant) { nil }
      #it { is_expected.to permit_action(:index) }
      it { expect(Pundit.policy_scope(participant,Submission)).to be_empty }
    end

    context 'for any participant' do
      let(:participant) { create(:participant) }
      #it { is_expected.to permit_action(:index) }
      it { expect(Pundit.policy_scope(participant,Submission)).to be_empty }
    end

    context 'for the private participant' do
      let(:participant) { p1 }
      #it { is_expected.to permit_action(:index) }
      it { expect(Pundit.policy_scope(participant,Submission)).to eq([s1]) }
    end

    context 'for an admin' do
      let(:participant) { create :participant, admin: true }
      it { expect(Pundit.policy_scope(participant,Submission).sort)
        .to eq(Submission.all.sort) }
    end

    context 'for the organizer' do
      let(:participant) { create :participant, organizer_id: challenge.organizer_id }
      it { expect(Pundit.policy_scope(participant,Submission).sort)
        .to eq(Submission.all.sort) }
    end
  end

  context 'private challenge completed' do
    let!(:challenge) {
      create(:challenge,
        :completed,
        private_challenge: true ) }
    let!(:round) { challenge.challenge_rounds.first }
    let!(:p1) { create :participant }
    let!(:i1) { create(:invitation,
        challenge_id: challenge.id,
        participant_id: p1.id,
        email: p1.email) }
    let!(:p2) { create :participant }
    let!(:i2) { create(:invitation,
        challenge_id: challenge.id,
        participant_id: p2.id,
        email: p2.email) }
    let!(:s1) { create :submission,
        challenge_id: challenge.id,
        challenge_round_id: round.id,
        participant_id: p1.id }
    let!(:s2) { create :submission,
        challenge_id: challenge.id,
        challenge_round_id: round.id,
        participant_id: p2.id }

    context 'for a public participant' do
      let(:participant) { nil }
      #it { is_expected.to permit_action(:index) }
      it { expect(Pundit.policy_scope(participant,Submission)).to be_empty }
    end

    context 'for any participant' do
      let(:participant) { create(:participant) }
      #it { is_expected.to permit_action(:index) }
      it { expect(Pundit.policy_scope(participant,Submission)).to be_empty }
    end

    context 'for the private participant' do
      let(:participant) { p1 }
      #it { is_expected.to permit_action(:index) }
      it { expect(Pundit.policy_scope(participant,Submission).sort)
        .to eq(Submission.all.sort) }
    end

    context 'for an admin' do
      let(:participant) { create :participant, admin: true }
      it { expect(Pundit.policy_scope(participant,Submission).sort)
        .to eq(Submission.all.sort) }
    end

    context 'for the organizer' do
      let(:participant) { create :participant, organizer_id: challenge.organizer_id }
      it { expect(Pundit.policy_scope(participant,Submission).sort)
        .to eq(Submission.all.sort) }
    end
  end

end
