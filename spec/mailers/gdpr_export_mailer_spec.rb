require "rails_helper"

RSpec.describe GdprExportMailer, type: :mailer do
  let!(:participant) { create :participant }
  let(:gdpr_fields) {
    [
      table: 'Participant',
      id_field: 'id',
      fields: [
        :email,
        :address,
        :name
      ]
    ]
  }

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

    it "#rows" do
      stub_const("GDPR_FIELDS",gdpr_fields)
      rows = described_class.new.rows(
        rec: GDPR_FIELDS[0],
        participant_id: participant.id)
      expect(rows.first).to eq(
        [participant.email, participant.address, participant.name ])
    end

    it '#plucked' do
      stub_const("GDPR_FIELDS",gdpr_fields)
      fields = described_class.new.plucked(rec: GDPR_FIELDS[0])
      expect(fields).to eq("email,address,name")
    end

    it '#query' do
      stub_const("GDPR_FIELDS",gdpr_fields)
      query = described_class.new.query(rec: GDPR_FIELDS[0], participant_id: participant.id)
      expect(query).to eq(
        "Participant.where(id: #{participant.id})")
    end

  end
end
