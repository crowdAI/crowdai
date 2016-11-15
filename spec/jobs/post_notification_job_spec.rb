require 'rails_helper'

RSpec.describe PostNotificationJob, type: :job do
  include ActiveJob::TestHelper

  let!(:topic) { create :topic, :with_posts }
  let!(:post) { topic.posts.last }

  describe 'executes the job' do
    subject(:job) { described_class.perform_later(post) }
    it 'queues the job' do
      expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    end

    it "send the email" do
      puts 'sending'
      PostNotificationJob.perform_later(post)
    end
  end

=begin
  describe 'private methods' do
    let(:job) { described_class.new(post) }
    let!(:admin) { create :participant, :admin }
    let!(:admin2) { create :participant, :admin }
    let!(:participant_ids) { topic.posts.collect {|obj| obj.id }}

    it "finds admin participants" do
      expect { job.admin_ids.to eq([admin.id,admin2.id]) }
    end

    it "finds participant subscribers" do
      expect { job.post_participants(post_id).to eq participant_ids }
    end

    it "finds all subscribers to the topic including admins" do
      all_ids = participant_ids.concat([admin.id, admin2.id])
      expect { job.subscribed_participants(post).to eq all_ids }
    end
  end
=end


end
