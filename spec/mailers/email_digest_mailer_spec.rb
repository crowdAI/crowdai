require "rails_helper"

RSpec.describe EmailDigestMailer, type: :mailer do
  let(:challenge) { create :challenge }
  let(:other_participant) { create :participant }
  let(:comment) { create :comment, participant: other_participant }
  let(:submission) { create :submission, challenge: challenge }
  let!(:mailer) { create :mailer, mailer_classname: described_class.to_s }

  context 'participant - daily digest' do
    let!(:participant) { create :participant }
    let!(:email_preference) { create :email_preference, :daily, participant: participant }

    it 'sends the email' do
      res = described_class.new.sendmail(participant.id,'daily')
      man = MandrillSpecHelper.new(res)
      expect(man.status).to eq 'sent'
      expect(man.reject_reason).to eq nil
      expect(Email.count).to eq(1)
      expect(Email.last.participant_id).to eq(participant.id)
      expect(Email.last.mailer_classname).to eq(described_class.to_s)
    end
  end

  context 'participant - weekly digest' do
    let!(:participant) { create :participant }
    let!(:email_preference) { create :email_preference, :weekly, participant: participant }

    it 'sends the email' do
      res = described_class.new.sendmail(participant.id,'weekly')
      man = MandrillSpecHelper.new(res)
      expect(man.status).to eq 'sent'
      expect(man.reject_reason).to eq nil
      expect(Email.count).to eq(1)
      expect(Email.last.participant_id).to eq(participant.id)
      expect(Email.last.mailer_classname).to eq(described_class.to_s)
    end
  end

  context 'admin - daily digest' do
    let!(:participant) { create :participant, :admin }
    let!(:email_preference) { create :email_preference, :daily, participant: participant }

    it 'sends the email' do
      res = described_class.new.sendmail(participant.id,'daily')
      man = MandrillSpecHelper.new(res)
      expect(man.status).to eq 'sent'
      expect(man.reject_reason).to eq nil
      expect(Email.count).to eq(1)
      expect(Email.last.participant_id).to eq(participant.id)
      expect(Email.last.mailer_classname).to eq(described_class.to_s)
    end
  end

  context 'admin - weekly digest' do
    let!(:participant) { create :participant, :admin }
    let!(:email_preference) { create :email_preference, :weekly, participant: participant }

    it 'sends the email' do
      res = described_class.new.sendmail(participant.id,'weekly')
      man = MandrillSpecHelper.new(res)
      expect(man.status).to eq 'sent'
      expect(man.reject_reason).to eq nil
      expect(Email.count).to eq(1)
      expect(Email.last.participant_id).to eq(participant.id)
      expect(Email.last.mailer_classname).to eq(described_class.to_s)
    end
  end

end
