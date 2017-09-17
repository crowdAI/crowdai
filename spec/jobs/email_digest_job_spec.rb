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

  describe 'executes the weekly digest' do
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

  end

  describe 'participant - daily digest: comments only' do
    let!(:challenge) { create :challenge }
    let!(:participant) { create :participant }
    let!(:topic_author1) { create :participant }
    let!(:email_preference1) { create :email_preference, :daily, participant: participant }
    let!(:email_preference2) { create :email_preference, :every_email, participant: topic_author1 }

    it 'should not receive email comment from 2 days ago' do
      Timecop.freeze(Time.now - 2.days)
        topic = FactoryGirl.create :topic, challenge: challenge, participant: topic_author1, topic: 'topic1'
        comment1 = FactoryGirl.create :comment, topic: topic, participant: topic_author1, comment: 'topic1_comment1'
        comment2 = FactoryGirl.create :comment, topic: topic, participant: participant, comment: 'topic1_comment2'
      Timecop.return
      comment3 = FactoryGirl.create :comment, topic: topic, participant: topic_author1, comment: 'topic1_comment3'
      perform_enqueued_jobs { described_class.perform_later({"digest_type":"daily"}) }

      expect(MandrillMessage.count).to eq(0)
    end

    it 'should receive email for comment from 12 hours ago' do
      Timecop.freeze(Time.now - 12.hours)
        topic = FactoryGirl.create :topic, challenge: challenge, participant: topic_author1, topic: 'topic1'
      Timecop.return
      comment1 = FactoryGirl.create :comment, topic: topic, participant: topic_author1, comment: 'topic1_comment1'
      comment2 = FactoryGirl.create :comment, topic: topic, participant: participant, comment: 'topic1_comment2'
      perform_enqueued_jobs { described_class.perform_later({"digest_type":"daily"}) }

      expect(MandrillMessage.count).to eq(1)
    end
  end

  describe 'admin - daily digest: submissions only' do
    let!(:participant) { create :participant, :admin }
    let!(:email_preference) { create :email_preference, :daily, participant: participant }

    it 'should not receive submission info from 2 days ago' do
      Timecop.freeze(Time.now - 2.days)
        submission = FactoryGirl.create :submission
      Timecop.return
      perform_enqueued_jobs { described_class.perform_later({"digest_type":"daily"}) }

      expect(MandrillMessage.count).to eq(0)
    end

    it 'should receive submission info from 12 hours ago' do
      Timecop.freeze(Time.now - 12.hours)
        submission = FactoryGirl.create :submission
      Timecop.return
      perform_enqueued_jobs { described_class.perform_later({"digest_type":"daily"}) }

      expect(MandrillMessage.count).to eq(1)
    end
  end

  describe 'participant - weekly digest: comments only' do
    let!(:challenge) { create :challenge }
    let!(:participant) { create :participant }
    let!(:topic_author1) { create :participant }
    let!(:email_preference1) { create :email_preference, :daily, participant: participant }
    let!(:email_preference2) { create :email_preference, :every_email, participant: topic_author1 }

    it 'should not receive email comment from 8 days ago' do
      Timecop.freeze(Date.today - 8.days)
        topic = FactoryGirl.create :topic, challenge: challenge, participant: topic_author1, topic: 'topic1'
        comment1 = FactoryGirl.create :comment, topic: topic, participant: topic_author1, comment: 'topic1_comment1'
        comment2 = FactoryGirl.create :comment, topic: topic, participant: participant, comment: 'topic1_comment2'
      Timecop.return
      comment3 = FactoryGirl.create :comment, topic: topic, participant: topic_author1, comment: 'topic1_comment3'
      perform_enqueued_jobs { described_class.perform_later({"digest_type":"daily"}) }

      expect(MandrillMessage.count).to eq(0)
    end

    it 'should receive email for comment from 3 days ago' do
      Timecop.freeze(Date.today - 3.days)
        topic = FactoryGirl.create :topic, challenge: challenge, participant: topic_author1, topic: 'topic1'
      Timecop.return
      comment1 = FactoryGirl.create :comment, topic: topic, participant: topic_author1, comment: 'topic1_comment1'
      comment2 = FactoryGirl.create :comment, topic: topic, participant: participant, comment: 'topic1_comment2'
      perform_enqueued_jobs { described_class.perform_later({"digest_type":"daily"}) }

      expect(MandrillMessage.count).to eq(1)
    end
  end

  describe 'admin - weekly digest: submissions only' do
    let!(:participant) { create :participant, :admin }
    let!(:email_preference) { create :email_preference, :weekly, participant: participant }

    it 'should not receive submission info from 8 days ago' do
      Timecop.freeze(Time.now - 8.days)
        submission = FactoryGirl.create :submission
      Timecop.return
      perform_enqueued_jobs { described_class.perform_later({"digest_type":"weekly"}) }

      expect(MandrillMessage.count).to eq(0)
    end

    it 'should receive submission info from 5 days ago' do
      Timecop.freeze(Time.now - 5.days)
        submission = FactoryGirl.create :submission
      Timecop.return
      perform_enqueued_jobs { described_class.perform_later({"digest_type":"weekly"}) }

      expect(MandrillMessage.count).to eq(1)
    end
  end

  describe 'admin - daily digest: comments and submissions' do
    let!(:admin) { create :participant, :admin }
    let!(:topic_author1) { create :participant }
    let!(:email_preference1) { create :email_preference, :daily, participant: admin }
    let!(:email_preference2) { create :email_preference, :every_email, participant: topic_author1 }

    it 'daily' do
      Timecop.freeze(Date.today - 12.hours)
        challenge = FactoryGirl.create :challenge
        topic = FactoryGirl.create :topic, challenge: challenge, participant: topic_author1, topic: 'topic1'
        comment1 = FactoryGirl.create :comment, topic: topic, participant: topic_author1, comment: 'topic1_comment1'
        comment2 = FactoryGirl.create :comment, topic: topic, participant: admin, comment: 'topic1_comment2'
        submission = FactoryGirl.create :submission, challenge: challenge, participant: topic_author1
      Timecop.return
      perform_enqueued_jobs { described_class.perform_later({"digest_type":"daily"}) }

      #expect(MandrillMessage.count).to eq(1)
    end
  end

end
