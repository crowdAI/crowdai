require 'spec_helper'
RSpec.describe Organizer::EuaNotificationMailer, type: :mailer do

  describe 'methods' do
    let!(:organizer_participant) { create :participant, organizer: organizer }
    let!(:organizer) { create :organizer, :clef }
    let!(:participant) { create :participant }
    let!(:clef_task) { create :clef_task }
    let!(:challenge) { create :challenge, clef_task: clef_task }
    let!(:email_preference) { create :email_preference, :every_email, participant: organizer_participant }

    it 'successfully sends a message' do
      #puts organizer_participant.id
      puts clef_task.id
      #puts participant.id
      res = described_class.new.sendmail(organizer_participant.id, clef_task.id, participant.id)
      man = MandrillSpecHelper.new(res)
      expect(man.status).to eq 'sent'
      expect(man.reject_reason).to eq nil
    end

    it 'addresses the email to the participant' do
      res = described_class.new.sendmail(organizer_participant.id, clef_task.id, participant.id)
      man = MandrillSpecHelper.new(res)
      expect(man.merge_var('NAME')).to eq(organizer_participant.name)
    end

    it 'produces a body which is correct HTML' do
      res = described_class.new.sendmail(organizer_participant.id, clef_task.id, participant.id)
      man = MandrillSpecHelper.new(res)
      expect(man.merge_var('BODY')).to be_a_valid_html_fragment
    end

    it 'produces a valid unsubscribe link' do
      res = described_class.new.sendmail(organizer_participant.id, clef_task.id, participant.id)
      man = MandrillSpecHelper.new(res)
      expect(man.merge_var('EMAIL_PREFERENCES_LINK')).to be_a_valid_html_fragment
    end
  end

end
