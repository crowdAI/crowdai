# frozen_string_literal: true
require 'rails_helper'

describe DatasetFilePolicy do
  subject { described_class.new(participant, dataset_file) }

  let(:challenge) { create(:challenge, organizer: organizer)}
  let(:dataset_file) { build(:dataset_file, challenge: challenge) }
  let(:organizer) { create(:organizer) }
  let(:organizer_person) { build(:participant, organizer: organizer) }

  context 'for a public participant' do
    let(:participant) { nil }
    it { is_expected.to forbid_action(:show) }
    it { is_expected.to forbid_action(:index) }
    it { is_expected.to forbid_action(:create) }
    it { is_expected.to forbid_action(:new) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:destroy) }
  end

  context 'for a participant' do
    let(:participant) { build(:participant) }
    it { is_expected.to forbid_action(:show) }
    it { is_expected.to permit_action(:index) }
    it { is_expected.to forbid_action(:create) }
    it { is_expected.to forbid_action(:new) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:destroy) }
  end

  context 'for the organizer' do
    let(:participant) { organizer_person }
    it { is_expected.to forbid_action(:show) }
    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:create) }
    it { is_expected.to permit_action(:new) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:edit) }
    it { is_expected.to permit_action(:destroy) }
  end

  context 'for an admin' do
    let(:participant) { build(:participant, :admin )}
    it { is_expected.to forbid_action(:show) }
    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:create) }
    it { is_expected.to permit_action(:new) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:edit) }
    it { is_expected.to permit_action(:destroy) }
  end

end
