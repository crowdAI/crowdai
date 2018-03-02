require 'rails_helper'

RSpec.describe SubmissionsRemainingQuery do
  let(:participant) { create :participant }
  let(:subject) {
    described_class.new(challenge: challenge, participant_id: participant.id)
  }

  
end
