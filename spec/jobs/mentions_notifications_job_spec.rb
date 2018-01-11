require 'rails_helper'

RSpec.describe MentionsNotificationsJob, type: :job do
  include ActiveJob::TestHelper

  let!(:participant) { create :participant }
  let!(:comment) { create :comment }

  describe 'queues the job' do

    subject(:job) { described_class.perform_later(mentioned_participant_ids: [participant.id], comment_id: comment.id) }

    it 'queues the job' do
      expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    end

    it 'is placed on the notifications queue' do
      expect(described_class.new.queue_name).to eq('notifications')
    end

    it 'executes with no errors' do
      perform_enqueued_jobs { job }
    end
  end

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end
end
