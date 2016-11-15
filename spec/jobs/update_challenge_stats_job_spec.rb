require 'rails_helper'

RSpec.describe UpdateChallengeStatsJob, type: :job do
  include ActiveJob::TestHelper

  let!(:topic) { create :topic, :with_posts }
  let!(:post) { topic.posts.last }


  describe 'executes the job' do
    subject(:job) { described_class.perform_later }
    it 'queues the job' do
      expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    end
  end


end
