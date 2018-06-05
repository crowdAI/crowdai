require "rails_helper"

RSpec.describe GdprExportMailer, type: :mailer do
  let!(:participant) { create :participant }
  let!(:comment) { create :comment, participant: participant }
  let!(:comment2) { create :comment, participant: participant }

  let(:gdpr_fields) {
    [
      {
        table: 'Participant',
        id_field: 'id',
        fields: [
          :id,
          :email,
          :address,
          :name
        ]
      },
      {
        table: 'Comment',
        id_field: 'participant_id',
        fields: [
          :id,
          :comment_markdown
        ]
      }
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

    context 'Participant' do
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
        expect(fields).to eq("id,email,address,name")
      end

      it '#query' do
        stub_const("GDPR_FIELDS",gdpr_fields)
        query = described_class.new.query(rec: GDPR_FIELDS[0], participant_id: participant.id)
        expect(query).to eq(
          "Participant.where(id: #{participant.id})")
      end
    end

    context 'Comment' do
      it "#rows" do
        stub_const("GDPR_FIELDS",gdpr_fields)
        rows = described_class.new.rows(
          rec: GDPR_FIELDS[1],
          participant_id: participant.id)
        expect(rows.first).to eq(
          [comment.id,comment.comment_markdown])
        expect(rows.second).to eq(
          [comment2.id,comment2.comment_markdown])
      end

      it '#plucked' do
        stub_const("GDPR_FIELDS",gdpr_fields)
        fields = described_class.new.plucked(rec: GDPR_FIELDS[1])
        expect(fields).to eq("id,comment_markdown")
      end

      it '#query' do
        stub_const("GDPR_FIELDS",gdpr_fields)
        query = described_class.new.query(rec: GDPR_FIELDS[1], participant_id: participant.id)
        expect(query).to eq(
          "Comment.where(participant_id: #{participant.id})")
      end
    end

  end
end
