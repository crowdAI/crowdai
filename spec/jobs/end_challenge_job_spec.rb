require 'rails_helper'

RSpec.describe EndChallengeJob, type: :job do
  include ActiveJob::TestHelper


  describe 'executes the job' do
    subject(:job) { described_class.perform_later }
    it 'queues the job' do
      expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    end
  end


end
