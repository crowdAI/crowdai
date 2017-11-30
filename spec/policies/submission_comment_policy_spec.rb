require 'rails_helper'

describe SubmissionCommentPolicy do
  subject { described_class.new(participant, submission_comment) }

  let(:submission_comment) { build(:submission_comment) }
  let(:user) { build(:participant) }

  context 'for a public participant' do
    let(:participant) { nil }

    it { is_expected.to forbid_action(:show) }
    it { is_expected.to forbid_action(:index) }
    it { is_expected.to forbid_action(:create) }
    it { is_expected.to permit_action(:new) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:destroy) }
  end

  context 'for a participant' do
    let(:participant) { user }

    it { is_expected.to forbid_action(:show) }
    it { is_expected.to forbid_action(:index) }
    it { is_expected.to permit_action(:create) }
    it { is_expected.to permit_action(:new) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:destroy) }
  end

end
