require 'rails_helper'

RSpec.describe EmailDigestJob, type: :job, api: true do
  include ActiveJob::TestHelper

  describe 'executes the daily digest' do
    let(:participant) {
      create :participant,
      email_frequency: :daily }
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
    let(:participant) {
      create :participant,
      email_frequency: :weekly }
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
    let!(:challenge) { create :challenge, :running }
    let!(:participant) {
      create :participant,
      email_frequency: :daily }
    let!(:topic_author1) { create :participant, :every_email }

    it 'should not receive email comment from 2 days ago' do
      Timecop.freeze(Time.now - 2.days)
        topic = FactoryBot.create :topic, challenge: challenge, participant: topic_author1, topic: 'topic1'
        comment1 = FactoryBot.create :comment, topic: topic, participant: topic_author1, comment: 'topic1_comment1'
        comment2 = FactoryBot.create :comment, topic: topic, participant: participant, comment: 'topic1_comment2'
      Timecop.return
      comment3 = FactoryBot.create :comment, topic: topic, participant: topic_author1, comment: 'topic1_comment3'
      perform_enqueued_jobs { described_class.perform_later("digest_type" => "daily") }

      expect(MandrillMessage.count).to eq(0)
    end

    it 'should receive email for comment from 12 hours ago' do
      Timecop.freeze(Time.now - 12.hours)
        topic = FactoryBot.create :topic, challenge: challenge, participant: topic_author1, topic: 'topic1'
      Timecop.return
      comment1 = FactoryBot.create :comment, topic: topic, participant: topic_author1, comment: 'topic1_comment1'
      comment2 = FactoryBot.create :comment, topic: topic, participant: participant, comment: 'topic1_comment2'
      perform_enqueued_jobs { described_class.perform_later("digest_type" => "daily") }

      expect(MandrillMessage.count).to eq(2)
    end
  end

  describe 'admin - daily digest: submissions only' do
    let!(:participant) { create :participant, :admin }
    before do
      participant.email_preferences.first.update_columns(    email_frequency: :every)
    end

    it 'should not receive submission info from 2 days ago' do
      Timecop.freeze(Time.now - 2.days)
        submission = FactoryBot.create :submission
      Timecop.return
      perform_enqueued_jobs { described_class.perform_later("digest_type" => "daily") }

      expect(MandrillMessage.count).to eq(0)
    end

    it 'should receive submission info from 12 hours ago' do
      Timecop.freeze(Time.now - 12.hours)
        submission = FactoryBot.create :submission
      Timecop.return
      perform_enqueued_jobs { described_class.perform_later("digest_type" => "daily") }

      expect(MandrillMessage.count).to eq(1)
    end
  end

  describe 'participant - weekly digest: comments only' do
    let!(:challenge) { create :challenge, :running }
    let!(:participant) { create :participant, :daily }
    let!(:topic_author1) { create :participant, :every_email }

    it 'should not receive email comment from 8 days ago' do
      Timecop.freeze(Date.today - 8.days)
        topic = FactoryBot.create :topic, challenge: challenge, participant: topic_author1, topic: 'topic1'
        comment1 = FactoryBot.create :comment, topic: topic, participant: topic_author1, comment: 'topic1_comment1'
        comment2 = FactoryBot.create :comment, topic: topic, participant: participant, comment: 'topic1_comment2'
      Timecop.return
      comment3 = FactoryBot.create :comment, topic: topic, participant: topic_author1, comment: 'topic1_comment3'
      perform_enqueued_jobs { described_class.perform_later("digest_type" => "daily") }

      expect(MandrillMessage.count).to eq(0)
    end

    it 'should receive email for comment from 3 days ago' do
      Timecop.freeze(Date.today - 3.days)
        topic = FactoryBot.create :topic, challenge: challenge, participant: topic_author1, topic: 'topic1'
      Timecop.return
      comment1 = FactoryBot.create :comment, topic: topic, participant: topic_author1, comment: 'topic1_comment1'
      comment2 = FactoryBot.create :comment, topic: topic, participant: participant, comment: 'topic1_comment2'
      perform_enqueued_jobs { described_class.perform_later("digest_type" => "daily") }

      expect(MandrillMessage.count).to eq(1)
    end
  end

  describe 'admin - weekly digest: submissions only' do
    let!(:participant) { create :participant, :weekly, admin: true }

    it 'should not receive submission info from 8 days ago' do
      Timecop.freeze(Time.now - 8.days)
        submission = FactoryBot.create :submission
      Timecop.return
      perform_enqueued_jobs { described_class.perform_later("digest_type" => "weekly") }

      expect(MandrillMessage.count).to eq(0)
    end

    it 'should receive submission info from 5 days ago' do
      Timecop.freeze(Time.now - 5.days)
        submission = FactoryBot.create :submission
      Timecop.return
      perform_enqueued_jobs { described_class.perform_later("digest_type" => "weekly") }

      expect(MandrillMessage.count).to eq(1)
    end
  end

  describe 'admin - daily digest: comments and submissions' do
    let!(:admin) { create :participant, :daily, admin: true }
    let!(:topic_author1) { create :participant, :every_email }

    it 'daily' do
      Timecop.freeze(Time.now - 12.hours)
        challenge = FactoryBot.create :challenge, :running
        topic = FactoryBot.create :topic, challenge: challenge, participant: topic_author1, topic: 'topic1'
        comment1 = FactoryBot.create :comment, topic: topic, participant: topic_author1, comment: 'topic1_comment1'
        comment2 = FactoryBot.create :comment, topic: topic, participant: admin, comment: 'topic1_comment2'
        submission = FactoryBot.create :submission, challenge: challenge, participant: topic_author1
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
