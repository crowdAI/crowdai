require 'rails_helper'

RSpec.describe EveryCommentNotificationJob, type: :job do
  include ActiveJob::TestHelper

  describe 'receive_every_email' do
    let!(:participant) { create :participant }
    let!(:email_preference) { create :email_preference, :every_email, participant: participant }
    let!(:topic) { create :topic, participant: participant }
    let!(:comment) { create :comment, topic: topic, participant: participant }
    subject(:job) { described_class.perform_later(comment.id) }

    it 'queues the job' do
      expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    end

    it 'is placed on the default queue' do
      expect(described_class.new.queue_name).to eq('default')
    end

    it 'executes with no errors' do
      perform_enqueued_jobs { job }
    end

    it 'writes to the email log' do
      expect {
        perform_enqueued_jobs { job }
      }.to change(MandrillMessage, :count).by(1)
    end

    it 'is sent by Mandrill' do
      perform_enqueued_jobs { job }
      man = MandrillMessage.last
      expect(man.status).to eq('sent')
    end
  end

  describe 'daily_digest' do
    let!(:participant) { create :participant }
    let!(:email_preference) { create :email_preference, :daily, participant: participant }
    let!(:topic) { create :topic, participant: participant }
    let!(:comment) { create :comment, topic: topic, participant: participant }
    subject(:job) { described_class.perform_later(comment.id) }

    it 'queues the job' do
      expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    end

    it 'is placed on the default queue' do
      expect(described_class.new.queue_name).to eq('default')
    end

    it 'executes with no errors' do
      perform_enqueued_jobs { job }
    end

    it 'is not sent by Mandrill' do
      perform_enqueued_jobs { job }
      expect(MandrillMessage.count).to eq(0)
    end
  end

  describe 'weekly digest' do
    let!(:participant) { create :participant }
    let!(:email_preference) { create :email_preference, :weekly, participant: participant }
    let!(:topic) { create :topic, participant: participant }
    let!(:comment) { create :comment, topic: topic, participant: participant }
    subject(:job) { described_class.perform_later(comment.id) }

    it 'queues the job' do
      expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    end

    it 'is placed on the default queue' do
      expect(described_class.new.queue_name).to eq('default')
    end

    it 'executes with no errors' do
      perform_enqueued_jobs { job }
    end

    it 'is not sent by Mandrill' do
      perform_enqueued_jobs { job }
      expect(MandrillMessage.count).to eq(0)
    end
  end

end
