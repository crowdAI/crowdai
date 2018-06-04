require 'rails_helper'

describe SubmissionPolicy do
  subject { described_class.new(participant, submission) }
  let(:submission) { s1 }

  context 'common permissions' do
    let!(:challenge) {
      create(:challenge, :running) }
    let!(:round) { challenge.challenge_rounds.first }
    let!(:p1) { create :participant }
    let!(:s1) { create :submission,
        challenge_id: challenge.id,
        challenge_round_id: round.id,
        participant_id: p1.id }

    context 'for a public participant' do
      let(:participant) { nil }
      it { is_expected.to permit_action(:index) }
      it { is_expected.to forbid_action(:create) }
      it { is_expected.to forbid_action(:new) }
      it { is_expected.to forbid_action(:update) }
      it { is_expected.to forbid_action(:edit) }
      it { is_expected.to forbid_action(:destroy) }
    end

    context 'for the participant' do
      let(:participant) { p1 }
      it { is_expected.to permit_action(:index) }
      it { is_expected.to forbid_action(:create) }
      it { is_expected.to forbid_action(:new) }
      it { is_expected.to forbid_action(:update) }
      it { is_expected.to forbid_action(:edit) }
      it { is_expected.to forbid_action(:destroy) }
    end

    describe 'organizer' do
      let(:participant) { create :participant, organizer: challenge.organizer }
      it { is_expected.to permit_action(:index) }
      it { is_expected.to forbid_action(:create) }
      it { is_expected.to forbid_action(:new) }
      it { is_expected.to permit_action(:update) }
      it { is_expected.to permit_action(:edit) }
      it { is_expected.to permit_action(:destroy) }
    end

    describe 'admin' do
      let(:participant) { build :participant, :admin }
      it { is_expected.to permit_action(:show) }
      it { is_expected.to permit_action(:index) }
      it { is_expected.to forbid_action(:create) }
      it { is_expected.to forbid_action(:new) }
      it { is_expected.to permit_action(:update) }
      it { is_expected.to permit_action(:edit) }
      it { is_expected.to permit_action(:destroy) }
    end
  end

  context 'challenge running / no leaderboard' do
    let!(:challenge) {
      create(:challenge,
        :running,
        show_leaderboard: false) }
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
      it { expect(Pundit.policy_scope(participant,Submission))
        .to be_empty }
    end

    context 'for any participant' do
      let(:participant) { create(:participant) }
      it { expect(Pundit.policy_scope(participant,Submission))
        .to be_empty }
    end

    context 'for the participant' do
      let(:participant) { p1 }
      it { is_expected.to permit_action(:index) }
      it { is_expected.to forbid_action(:create) }
      it { is_expected.to forbid_action(:new) }
      it { is_expected.to forbid_action(:update) }
      it { is_expected.to forbid_action(:edit) }
      it { is_expected.to forbid_action(:destroy) }
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

    context 'for the organizer of another challenge' do
      let(:other_organizer) { create :organizer }
      let(:participant) { create :participant, organizer_id: other_organizer.id }
      it { expect(Pundit.policy_scope(participant,Submission))
        .to be_empty }
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
      it { expect(Pundit.policy_scope(participant,Submission).sort)
        .to eq(Submission.all.sort) }
    end

    context 'for any participant' do
      let(:participant) { create(:participant) }
      it { expect(Pundit.policy_scope(participant,Submission).sort)
        .to eq(Submission.all.sort) }
    end

    context 'for the participant' do
      let(:participant) { p1 }
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

    context 'for the organizer of another challenge' do
      let(:other_organizer) { create :organizer }
      let(:participant) { create :participant, organizer_id: other_organizer.id }
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
      it { expect(Pundit.policy_scope(participant,Submission)).to be_empty }
    end

    context 'for any participant' do
      let(:participant) { create(:participant) }
      it { expect(Pundit.policy_scope(participant,Submission)).to be_empty }
    end

    context 'for the private participant' do
      let(:participant) { p1 }
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
      it { expect(Pundit.policy_scope(participant,Submission)).to be_empty }
    end

    context 'for any participant' do
      let(:participant) { create(:participant) }
      it { expect(Pundit.policy_scope(participant,Submission)).to be_empty }
    end

    context 'for the private participant' do
      let(:participant) { p1 }
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

  describe '#show' do
    context 'challenge running' do
      let!(:challenge) {
        create(:challenge,
          :running,
          submissions_page: true) }
      let!(:round) { challenge.challenge_rounds.first }
      let!(:p1) { create :participant }
      let!(:s1) { create :submission,
          challenge_id: challenge.id,
          challenge_round_id: round.id,
          participant_id: p1.id }
      let!(:s2) { create :submission,
          challenge_id: challenge.id,
          challenge_round_id: round.id,
          participant_id: p1.id }
      let!(:l1) { create :base_leaderboard,
          challenge_id: challenge.id,
          challenge_round_id: round.id,
          submission_id: s1.id }

      context 'on leaderboard' do
        let(:submission) { s1 }

        context 'for a public participant' do
          let(:participant) { nil }
          it { is_expected.to permit_action(:show) }
        end

        context 'for any public participant' do
          let(:participant) { create(:participant) }
          it { is_expected.to permit_action(:show) }
        end

        context 'for the participant' do
          let(:participant) { nil }
          it { is_expected.to permit_action(:show) }
        end

        context 'for the organizer' do
          let(:participant) {
            create :participant, organizer_id: challenge.organizer_id }
          it { is_expected.to permit_action(:show) }
        end
      end

      context 'not on leaderboard' do
        let(:submission) { s2 }

        context 'for a public participant' do
          let(:participant) { nil }
          it { is_expected.to permit_action(:show) }
        end

        context 'for any public participant' do
          let(:participant) { create(:participant) }
          it { is_expected.to permit_action(:show) }
        end

        context 'for the participant' do
          let(:participant) { p1 }
          it { is_expected.to permit_action(:show) }
        end

        context 'for the organizer' do
          let(:participant) {
            create :participant, organizer_id: challenge.organizer_id }
          it { is_expected.to permit_action(:show) }
        end
      end
    end # challenge running

    context 'challenge completed' do
      let!(:challenge) {
        create(:challenge,
          :completed,
          submissions_page: true) }
      let!(:round) { challenge.challenge_rounds.first }
      let!(:p1) { create :participant }
      let!(:s1) { create :submission,
          challenge_id: challenge.id,
          challenge_round_id: round.id,
          participant_id: p1.id }
      let!(:s2) { create :submission,
          challenge_id: challenge.id,
          challenge_round_id: round.id,
          participant_id: p1.id }
      let!(:l1) { create :base_leaderboard,
          challenge_id: challenge.id,
          challenge_round_id: round.id,
          submission_id: s1.id }

      context 'on leaderboard' do
        let(:submission) { s1 }

        context 'for a public participant' do
          let(:participant) { nil }
          it { is_expected.to permit_action(:show) }
        end

        context 'for any public participant' do
          let(:participant) { create(:participant) }
          it { is_expected.to permit_action(:show) }
        end

        context 'for the participant' do
          let(:participant) { nil }
          it { is_expected.to permit_action(:show) }
        end

        context 'for the organizer' do
          let(:participant) {
            create :participant, organizer_id: challenge.organizer_id }
          it { is_expected.to permit_action(:show) }
        end
      end

      context 'not on leaderboard' do
        let(:submission) { s2 }

        context 'for a public participant' do
          let(:participant) { nil }
          it { is_expected.to permit_action(:show) }
        end

        context 'for any public participant' do
          let(:participant) { create(:participant) }
          it { is_expected.to permit_action(:show) }
        end

        context 'for the participant' do
          let(:participant) { p1 }
          it { is_expected.to permit_action(:show) }
        end

        context 'for the organizer' do
          let(:participant) {
            create :participant, organizer_id: challenge.organizer_id }
          it { is_expected.to permit_action(:show) }
        end
      end
    end # challenge completed

    context 'private challenge running' do
      let!(:challenge) {
        create(:challenge,
          :running,
          private_challenge: true,
          show_leaderboard: false,
          submissions_page: true) }
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
          participant_id: p1.id }
      let!(:l1) { create :base_leaderboard,
          challenge_id: challenge.id,
          challenge_round_id: round.id,
          submission_id: s1.id }

      context 'on leaderboard' do
        let(:submission) { s1 }

        context 'for a public participant' do
          let(:participant) { nil }
          it { is_expected.to forbid_action(:show) }
        end

        context 'for any public participant' do
          let(:participant) { create(:participant) }
          it { is_expected.to forbid_action(:show) }
        end

        context 'for the participant' do
          let(:participant) { p1 }
          it { is_expected.to forbid_action(:show) }
        end

        context 'for a private participant' do
          let(:participant) { p2 }
          it { is_expected.to forbid_action(:show) }
        end

        context 'for the organizer' do
          let(:participant) {
            create :participant, organizer_id: challenge.organizer_id }
          it { is_expected.to permit_action(:show) }
        end
      end

      context 'not on leaderboard' do
        let(:submission) { s2 }

        context 'for a public participant' do
          let(:participant) { nil }
          it { is_expected.to forbid_action(:show) }
        end

        context 'for any public participant' do
          let(:participant) { create(:participant) }
          it { is_expected.to forbid_action(:show) }
        end

        context 'for the participant' do
          let(:participant) { p1 }
          it { is_expected.to forbid_action(:show) }
        end

        context 'for a private participant' do
          let(:participant) { p2 }
          it { is_expected.to forbid_action(:show) }
        end

        context 'for the organizer' do
          let(:participant) {
            create :participant, organizer_id: challenge.organizer_id }
          it { is_expected.to permit_action(:show) }
        end
      end
    end # private challenge running

    context 'private challenge completed' do
      let!(:challenge) {
        create(:challenge, :completed, private_challenge: true) }
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
          participant_id: p1.id }
      let!(:l1) { create :base_leaderboard,
          challenge_id: challenge.id,
          challenge_round_id: round.id,
          submission_id: s1.id }

      context 'on leaderboard' do
        let(:submission) { s1 }

        context 'for a public participant' do
          let(:participant) { nil }
          it { is_expected.to forbid_action(:show) }
        end

        context 'for any public participant' do
          let(:participant) { create(:participant) }
          it { is_expected.to forbid_action(:show) }
        end

        context 'for the participant' do
          let(:participant) { p1 }
          it { is_expected.to permit_action(:show) }
        end

        context 'for a private participant' do
          let(:participant) { p2 }
          it { is_expected.to permit_action(:show) }
        end

        context 'for the organizer' do
          let(:participant) {
            create :participant, organizer_id: challenge.organizer_id }
          it { is_expected.to permit_action(:show) }
        end
      end

      context 'not on leaderboard' do
        let(:submission) { s2 }

        context 'for a public participant' do
          let(:participant) { nil }
          it { is_expected.to forbid_action(:show) }
        end

        context 'for any public participant' do
          let(:participant) { create(:participant) }
          it { is_expected.to forbid_action(:show) }
        end

        context 'for the participant' do
          let(:participant) { p1 }
          it { is_expected.to permit_action(:show) }
        end

        context 'for a private participant' do
          let(:participant) { p2 }
          it { is_expected.to permit_action(:show) }
        end

        context 'for the organizer' do
          let(:participant) {
            create :participant, organizer_id: challenge.organizer_id }
          it { is_expected.to permit_action(:show) }
        end
      end
    end # private challenge completed

    context 'submission details not visible' do
      let!(:challenge) {
        create(:challenge,
          :completed,
          submissions_page: false) }
      let!(:round) { challenge.challenge_rounds.first }
      let!(:p1) { create :participant }
      let!(:s1) { create :submission,
          challenge_id: challenge.id,
          challenge_round_id: round.id,
          participant_id: p1.id }
      let!(:s2) { create :submission,
          challenge_id: challenge.id,
          challenge_round_id: round.id,
          participant_id: p1.id }
      let!(:l1) { create :base_leaderboard,
          challenge_id: challenge.id,
          challenge_round_id: round.id,
          submission_id: s1.id }

      context 'submission details not visible' do
        let(:submission) { s1 }

        context 'for a public participant' do
          let(:participant) { nil }
          it { is_expected.to forbid_action(:show) }
        end

        context 'for any participant' do
          let(:participant) { create(:participant) }
          it { is_expected.to forbid_action(:show) }
        end

        context 'for the participant' do
          let(:participant) { p1 }
          it { is_expected.to forbid_action(:show) }
        end

        context 'for the organizer' do
          let(:participant) {
            create :participant, organizer_id: challenge.organizer_id }
          it { is_expected.to forbid_action(:show) }
        end

        context 'for the admin' do
          let(:participant) {
            create :participant, :admin }
          it { is_expected.to forbid_action(:show) }
        end
      end
    end

    context 'submission details on / show leaderboard off' do
      let!(:challenge) {
        create(:challenge,
          :completed,
          show_leaderboard: false,
          submissions_page: true) }
      let!(:round) { challenge.challenge_rounds.first }
      let!(:p1) { create :participant }
      let!(:s1) { create :submission,
          challenge_id: challenge.id,
          challenge_round_id: round.id,
          participant_id: p1.id }
      let!(:s2) { create :submission,
          challenge_id: challenge.id,
          challenge_round_id: round.id,
          participant_id: p1.id }
      let!(:l1) { create :base_leaderboard,
          challenge_id: challenge.id,
          challenge_round_id: round.id,
          submission_id: s1.id }

      context 'submission details not visible' do
        let(:submission) { s1 }

        context 'for a public participant' do
          let(:participant) { nil }
          it { is_expected.to forbid_action(:show) }
        end

        context 'for any public participant' do
          let(:participant) { create(:participant) }
          it { is_expected.to forbid_action(:show) }
        end

        context 'for the participant' do
          let(:participant) { p1 }
          it { is_expected.to forbid_action(:show) }
        end

        context 'for the organizer' do
          let(:participant) {
            create :participant, organizer_id: challenge.organizer_id }
          it { is_expected.to permit_action(:show) }
        end

        context 'for the admin' do
          let(:participant) {
            create :participant, :admin }
          it { is_expected.to permit_action(:show) }
        end
      end
    end


  end #show

end
