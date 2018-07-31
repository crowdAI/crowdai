require 'rails_helper'

RSpec.describe Prometheus::ParticipantCounterService do

  describe '#call' do
    it do
      expect {
        described_class.new.call
      }.to change{EventLog.count}.by(1)
    end
  end

end
