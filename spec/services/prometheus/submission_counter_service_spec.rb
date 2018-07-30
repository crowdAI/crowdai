require 'rails_helper'

RSpec.describe Prometheus::SubmissionCounterService do
  let(:submission) { create :submission }

  describe '#call' do
    #it do
    #  expect {
    #    described_class.new(submission_id: submission.id).call
    #  }.to change{EventLog.count}.by(1)
    #end
  end

end
