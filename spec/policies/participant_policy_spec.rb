# frozen_string_literal: true
require 'rails_helper'

describe ParticipantPolicy do
  subject { described_class.new(user, participant) }

  let(:participant)                 { create(:participant) }
  let(:admin)                       { create(:participant, :admin)}
  let(:organizer_participant)       { create(:participant, :organizer) }
  let(:clef_organizer_participant)  { create(:participant, :clef_organizer) }


  context 'for a public participant' do
    let(:user) { nil }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to forbid_action(:index) }
    it { is_expected.to forbid_action(:create) }
    it { is_expected.to forbid_action(:new) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:destroy) }
    it { is_expected.to forbid_action(:regen_api_key) }
    it { is_expected.to forbid_action(:clef_access) }
  end

  context 'for the participant themself' do
    let(:user) { participant }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to forbid_action(:index) }
    it { is_expected.to forbid_action(:create) }
    it { is_expected.to forbid_action(:new) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:edit) }
    it { is_expected.to permit_action(:destroy) }
    it { is_expected.to permit_action(:regen_api_key) }
    it { is_expected.to permit_action(:clef_access) }
  end

  context 'for an admin' do
    let(:user) { admin }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to forbid_action(:index) }
    it { is_expected.to forbid_action(:create) }
    it { is_expected.to forbid_action(:new) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:edit) }
    it { is_expected.to permit_action(:destroy) }
    it { is_expected.to permit_action(:regen_api_key) }
    it { is_expected.to permit_action(:clef_access) }
  end

  context 'for an organizer' do
    let(:user) { organizer_participant }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to forbid_action(:index) }
    it { is_expected.to forbid_action(:create) }
    it { is_expected.to forbid_action(:new) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:destroy) }
    it { is_expected.to forbid_action(:regen_api_key) }
    it { is_expected.to forbid_action(:clef_access) }
  end

  context 'for an CLEF organizer' do
    let(:user) { clef_organizer_participant }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to forbid_action(:index) }
    it { is_expected.to forbid_action(:create) }
    it { is_expected.to forbid_action(:new) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:destroy) }
    it { is_expected.to forbid_action(:regen_api_key) }
    it { is_expected.to permit_action(:clef_access) }
  end

end
