require 'rails_helper'

RSpec.describe ChallengeRound, type: :model do

  context 'limit and period are both or none' do
    let(:challenge) { build :challenge }
    let(:challenge_round) { build :challenge_round, challenge: challenge}
    before do
      challenge_round.submission_limit = 5
    end

  end

  context 'defaults' do
    describe 'leaderboard title defaults to "Leaderboard"' do
      let(:challenge_round) { create :challenge_round }
      it { expect(challenge_round.challenge_round).to eq('Round 1')}
    end
  end

end
