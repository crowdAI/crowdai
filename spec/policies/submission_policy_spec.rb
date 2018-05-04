require 'rails_helper'

describe SubmissionPolicy do
  subject { described_class.new(participant, submission) }

  let(:submission) { build(:submission, participant: user) }
  let(:user) { build(:participant) }

  context 'for a public participant' do
    let(:participant) { nil }
    it { is_expected.to forbid_action(:index) }
    it { is_expected.to forbid_action(:create) }
    it { is_expected.to forbid_action(:new) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:destroy) }
  end

  context 'for a participant themself' do
    let(:participant) { user }
    it { is_expected.to permit_action(:index) }
    it { is_expected.to forbid_action(:create) }
    it { is_expected.to forbid_action(:new) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:destroy) }
  end

  context 'for the challenge owner or admin' do
    let(:organizer) { create :organizer }
    let(:challenge) { create :challenge, organizer: organizer }
    let(:submission) { build :submission, challenge: challenge, participant: user }

    describe 'organizer' do
      let(:participant) { create :participant, organizer: organizer }
      it { is_expected.to permit_action(:index) }
      it { is_expected.to forbid_action(:create) }
      it { is_expected.to forbid_action(:new) }
      it { is_expected.to permit_action(:update) }
      it { is_expected.to permit_action(:edit) }
      it { is_expected.to forbid_action(:destroy) }
    end

    describe 'admin' do
      let(:participant) { build :participant, :admin }
      it { is_expected.to permit_action(:index) }
      it { is_expected.to forbid_action(:create) }
      it { is_expected.to forbid_action(:new) }
      it { is_expected.to permit_action(:update) }
      it { is_expected.to permit_action(:edit) }
      it { is_expected.to forbid_action(:destroy) }
    end
  end

  context 'submissions#show & challenges.submission_page is false' do
    let(:participant) { nil }
    let(:challenge) {
      create :challenge,
      submissions_page: false }
    let(:submission) {
      build :submission,
      challenge: challenge,
      participant: user,
      grading_status_cd: 'graded' }
    it { is_expected.to forbid_action(:show) }
  end

  context 'submissions#show when challenges.submission_page is true' do
    let(:participant) { nil }
    let(:challenge) {
      create :challenge,
      submissions_page: true }
    context 'when submission not graded' do
      let(:submission) {
        build :submission,
        challenge: challenge,
        participant: user,
        grading_status_cd: 'submitted' }
      it { is_expected.to forbid_action(:show) }
    end

    context 'when submission graded' do
      let(:participant) { nil }
      let(:submission) {
        build :submission,
        challenge: challenge,
        participant: user,
        grading_status_cd: 'graded' }
      it { is_expected.to permit_action(:show) }
    end
  end

end
