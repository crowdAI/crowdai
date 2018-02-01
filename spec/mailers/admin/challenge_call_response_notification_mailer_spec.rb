require 'spec_helper'
RSpec.describe Admin::ChallengeCallResponseNotificationMailer, type: :mailer do

  describe 'methods' do
    let(:participant) { create :participant, :admin }
    let!(:email_preference) { create :email_preference, :every_email, participant: participant }
    let(:challenge_call_response) { create :challenge_call_response }

    it 'successfully sends a message' do
      res = described_class.new.sendmail(participant.id,challenge_call_response)
      man = MandrillSpecHelper.new(res)
      expect(man.status).to eq 'sent'
      expect(man.reject_reason).to eq nil
    end

    it 'addresses the email to the participant' do
      res = described_class.new.sendmail(participant.id,challenge_call_response)
      man = MandrillSpecHelper.new(res)
      expect(man.merge_var('NAME')).to eq(participant.name)
    end

    it 'produces a body which is correct HTML' do
      res = described_class.new.sendmail(participant.id,challenge_call_response)
      man = MandrillSpecHelper.new(res)
      expect(man.merge_var('BODY')).to be_a_valid_html_fragment
    end

    it 'produces a valid unsubscribe link' do
      res = described_class.new.sendmail(participant.id,challenge_call_response)
      man = MandrillSpecHelper.new(res)
      expect(man.merge_var('EMAIL_PREFERENCES_LINK')).to be_a_valid_html_fragment
    end
  end

end
