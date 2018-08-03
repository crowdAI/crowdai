require 'rails_helper'
RSpec.describe Admin::ChallengeCallResponseNotificationJob, type: :job do
  include ActiveJob::TestHelper

  let(:challenge_call_response) { create :challenge_call_response }
  let!(:admin) { create :participant, :admin }

  before do
    admin.email_preferences.first.update(email_frequency: :every)
  end
  
  subject(:job) { described_class.perform_later(challenge_call_response) }

  describe 'queues the job' do
    it 'queues the job' do
      expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    end

    it 'is placed on the default queue' do
      expect(described_class.new.queue_name).to eq('default')
    end

    it 'executes with no errors' do
      perform_enqueued_jobs { job }
    end

    after do
      clear_enqueued_jobs
      clear_performed_jobs
    end
  end

end
