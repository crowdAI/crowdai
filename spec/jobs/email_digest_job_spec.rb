require 'rails_helper'

RSpec.describe EmailDigestJob, type: :job do
  include ActiveJob::TestHelper

  describe 'executes the daily digest' do
    let(:email_preference) { create :email_preference, :daily }
    subject(:job) { described_class.perform_later('daily') }

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

  describe 'executes the daily digest' do
    let(:email_preference) { create :email_preference, :weekly }
    subject(:job) { described_class.perform_later('weekly') }

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


end
