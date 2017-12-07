require 'rails_helper'

RSpec.describe ChallengeCallResponse, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :challenge_call }
  end
end
