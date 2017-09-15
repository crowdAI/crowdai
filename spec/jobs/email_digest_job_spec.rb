require 'rails_helper'

RSpec.describe EmailDigestJob, type: :job do
  include ActiveJob::TestHelper

  describe 'executes the daily digest' do
    let(:email_preference) { create :email_preference, :daily }
    let(:mailer) { create :crowdai_mailer, mailer_classname: 'EmailDigestMailer' }
    subject(:job) { described_class.perform_later({"digest_type":"daily"}) }

    it 'queues the job' do
      expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    end

    it 'is placed on the default queue' do
      expect(described_class.new.queue_name).to eq("digest")
    end

    it 'executes with no errors' do
      perform_enqueued_jobs { job }
    end
  end

  describe 'executes the daily digest' do
    let(:email_preference) { create :email_preference, :weekly }
    subject(:job) { described_class.perform_later({"digest_type":"weekly"}) }

    it 'queues the job' do
      expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    end

    it 'is placed on the default queue' do
      expect(described_class.new.queue_name).to eq('digest')
    end

    it 'executes with no errors' do
      perform_enqueued_jobs { job }
    end

    it 'writes to the email log' do
      expect {
        perform_enqueued_jobs { described_class.perform_later({"digest_type":"daily"}) }
      }.to change(MandrillMessage, :count).by(1)
    end
  end

  describe 'participant - daily digest' do
    context 'comment before period' do
      let!(:challenge) { create :challenge }
      let!(:participant) { create :participant }
      let!(:topic_author1) { create :participant }
      let!(:email_preference) { create :email_preference, :daily, participant: participant }
      let!(:email_preference) { create :email_preference, :weekly, participant: topic_author1 }

      it 'should not receive email for topic_1_comment_1' do
        Timecop.freeze(Date.today - 2.days)
          topic = FactoryGirl.create :topic, challenge: challenge, participant: topic_author1, topic: 'topic1'
          comment1 = FactoryGirl.create :comment, topic: topic, participant: topic_author1, comment: 'topic1_comment1'
          comment2 = FactoryGirl.create :comment, topic: topic, participant: participant, comment: 'topic1_comment2'
        Timecop.return

        comment3 = FactoryGirl.create :comment, topic: topic, participant: topic_author1, comment: 'topic1_comment3'

        perform_enqueued_jobs { described_class.perform_later({"digest_type":"daily"}) }
        man = MandrillSpecHelper.new(MandrillMessage.last.res)
        expect(man.status).to eq 'sent'
        expect(man.reject_reason).to eq nil
      end

      it 'should not receive email for topic_1_comment_2' do

      end

      it 'should receive email for topic_1_comment_3' do

      end
    end
  end

end
