require 'rails_helper'

RSpec.describe SubmissionNotificationJob, type: :job do
  include ActiveJob::TestHelper

  let(:submission) { create :submission }

  describe 'executes the job' do
    subject(:job) { described_class.perform_later(submission) }
    it 'queues the job' do
      expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    end

    it "send the email" do
      puts 'sending'
      SubmissionNotificationJob.perform_later(submission)
    end
  end

end
