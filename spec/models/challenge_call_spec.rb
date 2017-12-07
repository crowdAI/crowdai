require 'rails_helper'

RSpec.describe ChallengeCall, type: :model do
  context 'associations' do
    it { is_expected.to have_many :challenge_call_responses }
  end
end
