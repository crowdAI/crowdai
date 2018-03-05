require 'rails_helper'

RSpec.describe ChallengeRound, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :challenge }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:challenge_round) }
  end

  context 'defaults' do
    describe 'leaderboard title defaults to "Leaderboard"' do
      let(:challenge_round) { create :challenge_round }
      it { expect(challenge_round.challenge_round).to eq('Round 1')}
    end
  end

end
