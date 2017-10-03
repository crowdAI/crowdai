require 'rails_helper'

describe Discussion::Cell::TopicAdmin, type: :cell do
  controller ApplicationController

  let(:participant) { create :participant }
  let(:author) { create :participant }
  let(:admin) { create :participant, :admin }
  let(:topic) { create :topic, participant: author }

  context 'public user' do
    subject { cell(described_class, topic, current_participant: nil ).show() }
    it { expect(subject).to be_nil }
  end

  context 'author' do
    subject { cell(described_class, topic, current_participant: author ).show() }
    it { expect(subject).to be_nil }
  end

  context 'participant' do
    subject { cell(described_class, topic, current_participant: participant ).show() }
    it { expect(subject).to be_nil }
  end

  context 'admin' do
    subject { cell(described_class, topic, current_participant: admin ).show() }
    it { expect(subject).not_to be_nil }
  end

end
