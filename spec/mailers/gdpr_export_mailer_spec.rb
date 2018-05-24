require "rails_helper"

RSpec.describe GdprExportMailer, type: :mailer do
  let!(:participant) { create :participant }

  describe '#methods' do
    it 'produces an Base64 encoded attachment' do
      expect(described_class.new
        .encoded_attachment(participant_id: participant.id))
        .not_to be_nil
    end

    it 'successfully sends a message' do
      res = described_class.new.sendmail(
        participant_id: participant.id)
      man = MandrillSpecHelper.new(res)
      expect(man.status).to eq 'queued'
      expect(man.reject_reason).to eq nil
    end

  end
end
