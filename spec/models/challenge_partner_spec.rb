require 'rails_helper'

RSpec.describe ChallengePartner, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:challenge) }
  end
end
