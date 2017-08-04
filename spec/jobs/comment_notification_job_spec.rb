require 'rails_helper'

RSpec.describe CommentNotificationJob, type: :job do
  include ActiveJob::TestHelper

  let!(:author) { create :participant }
  let!(:participant1) { create :participant }
  let!(:participant2) { create :participant }
  let!(:admin) { create :participant, :admin }
  let!(:topic) { create :topic, participant: author }
  let!(:comment1) { create :comment, topic: topic, participant: participant1 }
  let!(:comment2) { create :comment, topic: topic, participant: author }
  let!(:mailer) { create :mailer, mailer_classname: 'CommentNotificationMailer' }

  describe 'executes the job' do
    subject(:job) { described_class.perform_later(comment2) }

    it 'queues the job' do
      expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    end

    it 'is placed on the default queue' do
      expect(described_class.new.queue_name).to eq('default')
    end

    it 'executes with no errors' do
      perform_enqueued_jobs { job }
    end
  end


  describe 'supporting methods' do
    before(:each) do
      pref = participant2.email_preferences.first
      pref.update(any_post: false)
      pref.save
    end

    subject(:job) { described_class.new }
    it '#admin_ids' do
      expect(job.admin_ids).to match_array([admin.id])
    end

    it '#comment_participant_ids' do
      expect(job.comment_participant_ids(comment2)).to match_array([author.id,participant1.id])
    end

    it '#subscribed_participant_ids' do
      expect(job.subscribed_participant_ids(comment2)).to match_array([author.id,participant1.id,admin.id])
    end
  end

end
