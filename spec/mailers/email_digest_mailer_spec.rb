require "rails_helper"

RSpec.describe EmailDigestMailer, type: :mailer do
  let(:challenge) { create :challenge }
  let(:other_participant) { create :participant }
  let!(:email_preference) { create :email_preference, :every_email, participant: other_participant }
  let(:comment) { create :comment, participant: other_participant }
  let(:submission) { create :submission, challenge: challenge }

  context 'methods' do
    before do
      Timecop.freeze(Time.now)
    end

    describe '#set_start_dttm' do
      it 'daily' do
        start_dttm = described_class.new.set_start_dttm('daily')
        expect(start_dttm).to eq(Time.now - 24.hours)
      end
      it 'weekly' do
        start_dttm = described_class.new.set_start_dttm('weekly')
        expect(start_dttm).to eq(Time.now - 7.days)
      end
    end

    describe '#build_subject' do
      it 'daily' do
        subj = described_class.new.build_subject('daily')
        expect(subj).to eq("[crowdAI] Daily digest")
      end

      it 'weekly' do
        subj = described_class.new.build_subject('weekly')
        expect(subj).to eq("[crowdAI] Weekly digest")
      end
    end

    describe '#build_body' do
      let!(:participant) { create :participant }
      let!(:email_preference) { create :email_preference, :daily, participant: participant }
      before do
        @submissions = Submission.all
        @comments = Comment.all
      end
      it 'daily' do
        body = described_class.new.build_body(participant,'daily',@comments,@submissions)
        expect(body).to be_a_valid_html_fragment
      end
      it 'weekly' do
        body = described_class.new.build_body(participant,'weekly',@comments,@submissions)
        expect(body).to be_a_valid_html_fragment
      end
    end

    describe '#body_header' do
      it 'daily' do
        header = described_class.new.body_header('daily')
        expect(header).to eq("<div>Here's a daily summary of activity in crowdAI.</div>")
      end
      it 'weekly' do
        header = described_class.new.body_header('weekly')
        expect(header).to eq("<div>Here's a weekly summary of activity in crowdAI.</div>")
      end
    end

    describe '#comments' do
    end

    describe '#submissions' do
    end

    describe '#render_comments' do
    end

    describe '#render_submissions' do
    end
  end

=begin
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
=end

end
