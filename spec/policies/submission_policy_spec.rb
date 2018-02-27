require 'rails_helper'

describe SubmissionPolicy do
  subject { described_class.new(participant, submission) }

  let(:submission) { build(:submission, participant: user) }
  let(:user) { build(:participant) }

  context 'for a public participant' do
    let(:participant) { nil }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to forbid_action(:index) }
    it { is_expected.to forbid_action(:create) }
    it { is_expected.to forbid_action(:new) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:destroy) }
  end

  context 'for a participant themself' do
    let(:participant) { user }
    it { is_expected.to permit_action(:show) }
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
      it { is_expected.to permit_action(:show) }
      it { is_expected.to permit_action(:index) }
      it { is_expected.to forbid_action(:create) }
      it { is_expected.to forbid_action(:new) }
      it { is_expected.to forbid_action(:update) }
      it { is_expected.to forbid_action(:edit) }
      it { is_expected.to forbid_action(:destroy) }
    end

    describe 'admin' do
      let(:participant) { build :participant, :admin }
      it { is_expected.to permit_action(:show) }
      it { is_expected.to permit_action(:index) }
      it { is_expected.to forbid_action(:create) }
      it { is_expected.to forbid_action(:new) }
      it { is_expected.to forbid_action(:update) }
      it { is_expected.to forbid_action(:edit) }
      it { is_expected.to forbid_action(:destroy) }
    end
  end

end
