require 'rails_helper'
RSpec.describe Admin::OrganizerApplicationNotificationJob, type: :job do
  include ActiveJob::TestHelper

  let(:organizer_application) { create :organizer_application }
  subject(:job) { described_class.perform_later(organizer_application) }

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
