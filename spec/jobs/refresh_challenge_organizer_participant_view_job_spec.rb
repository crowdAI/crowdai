require 'rails_helper'

RSpec.describe RefreshChallengeOrganizerParticipantViewJob, type: :job do
  include ActiveJob::TestHelper

  let!(:organizer) { create :organizer }
  let!(:participant) {
    create :participant, organizer_id: organizer.id }

  let(:clef_task) { create :clef_task }
  let(:clef_organizer) {
    create :organizer, :clef, clef_task_id: clef_task.id }
  let(:challenge) {
    create :challenge, organizer_id: clef_organizer.id }
  let(:participant2) {
    create :participant, organizer_id: clef_organizer.id }

  describe 'queues the job' do

    subject(:job) { described_class.perform_later }

    it 'queues the job' do
      expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    end

    it 'is placed on the notifications queue' do
      expect(described_class.new.queue_name).to eq('default')
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
