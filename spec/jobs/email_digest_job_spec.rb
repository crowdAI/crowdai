require 'rails_helper'

RSpec.describe EmailDigestJob, type: :job do
  include ActiveJob::TestHelper

  describe 'executes the daily digest' do
    let(:participant) { create :participant, :daily }
    subject(:job) { described_class.perform_later("digest_type" => "daily") }

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
    let(:participant) { create :participant, :weekly }
    subject(:job) { described_class.perform_later("digest_type" => "weekly") }

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
    let!(:participant) { create :participant, :daily }
    let!(:topic_author1) { create :participant, :every_email }

    it 'should not receive email comment from 2 days ago' do
      Timecop.freeze(Time.now - 2.days)
        topic = FactoryGirl.create :topic, challenge: challenge, participant: topic_author1, topic: 'topic1'
        comment1 = FactoryGirl.create :comment, topic: topic, participant: topic_author1, comment: 'topic1_comment1'
        comment2 = FactoryGirl.create :comment, topic: topic, participant: participant, comment: 'topic1_comment2'
      Timecop.return
      comment3 = FactoryGirl.create :comment, topic: topic, participant: topic_author1, comment: 'topic1_comment3'
      perform_enqueued_jobs { described_class.perform_later("digest_type" => "daily") }

      expect(MandrillMessage.count).to eq(0)
    end

    it 'should receive email for comment from 12 hours ago' do
      Timecop.freeze(Time.now - 12.hours)
        topic = FactoryGirl.create :topic, challenge: challenge, participant: topic_author1, topic: 'topic1'
      Timecop.return
      comment1 = FactoryGirl.create :comment, topic: topic, participant: topic_author1, comment: 'topic1_comment1'
      comment2 = FactoryGirl.create :comment, topic: topic, participant: participant, comment: 'topic1_comment2'
      perform_enqueued_jobs { described_class.perform_later("digest_type" => "daily") }

      expect(MandrillMessage.count).to eq(2)
    end
  end

  describe 'admin - daily digest: submissions only' do
    let!(:participant) { create :participant, :admin }
    before do
      participant.email_preferences.first.update_columns(receive_every_email: false, receive_daily_digest: true, receive_weekly_digest: false)
    end

    it 'should not receive submission info from 2 days ago' do
      Timecop.freeze(Time.now - 2.days)
        submission = FactoryGirl.create :submission
      Timecop.return
      perform_enqueued_jobs { described_class.perform_later("digest_type" => "daily") }

      expect(MandrillMessage.count).to eq(0)
    end

    it 'should receive submission info from 12 hours ago' do
      Timecop.freeze(Time.now - 12.hours)
        submission = FactoryGirl.create :submission
      Timecop.return
      perform_enqueued_jobs { described_class.perform_later("digest_type" => "daily") }

      expect(MandrillMessage.count).to eq(1)
    end
  end

  describe 'participant - weekly digest: comments only' do
    let!(:challenge) { create :challenge }
    let!(:participant) { create :participant, :daily }
    let!(:topic_author1) { create :participant, :every_email }

    it 'should not receive email comment from 8 days ago' do
      Timecop.freeze(Date.today - 8.days)
        topic = FactoryGirl.create :topic, challenge: challenge, participant: topic_author1, topic: 'topic1'
        comment1 = FactoryGirl.create :comment, topic: topic, participant: topic_author1, comment: 'topic1_comment1'
        comment2 = FactoryGirl.create :comment, topic: topic, participant: participant, comment: 'topic1_comment2'
      Timecop.return
      comment3 = FactoryGirl.create :comment, topic: topic, participant: topic_author1, comment: 'topic1_comment3'
      perform_enqueued_jobs { described_class.perform_later("digest_type" => "daily") }

      expect(MandrillMessage.count).to eq(0)
    end

    it 'should receive email for comment from 3 days ago' do
      Timecop.freeze(Date.today - 3.days)
        topic = FactoryGirl.create :topic, challenge: challenge, participant: topic_author1, topic: 'topic1'
      Timecop.return
      comment1 = FactoryGirl.create :comment, topic: topic, participant: topic_author1, comment: 'topic1_comment1'
      comment2 = FactoryGirl.create :comment, topic: topic, participant: participant, comment: 'topic1_comment2'
      perform_enqueued_jobs { described_class.perform_later("digest_type" => "daily") }

      expect(MandrillMessage.count).to eq(1)
    end
  end

  describe 'admin - weekly digest: submissions only' do
    let!(:participant) { create :participant, :admin }
    before do
      participant.email_preferences.first.update_columns(receive_every_email: false, receive_daily_digest: false, receive_weekly_digest: true)
    end

    it 'should not receive submission info from 8 days ago' do
      Timecop.freeze(Time.now - 8.days)
        submission = FactoryGirl.create :submission
      Timecop.return
      perform_enqueued_jobs { described_class.perform_later("digest_type" => "weekly") }

      expect(MandrillMessage.count).to eq(0)
    end

    it 'should receive submission info from 5 days ago' do
      Timecop.freeze(Time.now - 5.days)
        submission = FactoryGirl.create :submission
      Timecop.return
      perform_enqueued_jobs { described_class.perform_later("digest_type" => "weekly") }

      expect(MandrillMessage.count).to eq(1)
    end
  end

  describe 'admin - daily digest: comments and submissions' do
    let!(:admin) { create :participant, :admin }
    let!(:topic_author1) { create :participant, :every_email }
    before do
      admin.email_preferences.first.update_columns(receive_every_email: false, receive_daily_digest: true, receive_weekly_digest: false)
    end

    it 'daily' do
      Timecop.freeze(Time.now - 12.hours)
        challenge = FactoryGirl.create :challenge
        topic = FactoryGirl.create :topic, challenge: challenge, participant: topic_author1, topic: 'topic1'
        comment1 = FactoryGirl.create :comment, topic: topic, participant: topic_author1, comment: 'topic1_comment1'
        comment2 = FactoryGirl.create :comment, topic: topic, participant: admin, comment: 'topic1_comment2'
        submission = FactoryGirl.create :submission, challenge: challenge, participant: topic_author1
      Timecop.return
      perform_enqueued_jobs { described_class.perform_later("digest_type" => "daily") }

      expect(MandrillMessage.count).to eq(2)
    end
  end

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end

end
