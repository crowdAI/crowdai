require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe UpdateChallengeStatsJob, type: :job do

  let!(:topic) { create :topic, :with_posts }
  let!(:post) { topic.posts.last }


  describe 'executes the job' do
    subject(:job) { described_class.perform_async }
    it 'queues the job' do
      expect { job }.to change(described_class.jobs, :size).by(1)
    end
  end


end
