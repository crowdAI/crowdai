require 'rails_helper'

RSpec.describe MailchimpService do

  let!(:participant) { create :participant }

  describe '#initialize' do
    subject { described_class.new(participant.id) }

    it { expect(subject).to be_a described_class }
    it { expect(subject.instance_variable_get(:@participant).id).to eq(participant.id) }
  end


  describe '#lower_case_md5_hashed_email_address' do
    subject { described_class.new(participant.id).lower_case_md5_hashed_email_address }
    it { expect(subject.length).to eq(32) }
  end

  describe '#gibbon' do
    subject { described_class.new(participant.id).gibbon }
    it { expect(subject).to be_a Gibbon::Request }
  end

  describe '#subscribed?' do
    context 'false' do
      subject { described_class.new(participant.id) }
      it { expect(subject.subscribed?).to be false}
    end
    context 'true' do
      participant = FactoryBot.create :participant
      mailchimp = described_class.new(participant.id)
      mailchimp.subscribe
      it { expect(mailchimp.subscribed?).to be true }
    end
    context 'unsubscribe' do
      participant = FactoryBot.create :participant
      mailchimp = described_class.new(participant.id)
      mailchimp.subscribe
      mailchimp.unsubscribe
      it { expect(mailchimp.subscribed?).to be false }
    end
  end

end
