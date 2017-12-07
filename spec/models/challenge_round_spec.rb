require 'rails_helper'

RSpec.describe ChallengeRound, type: :model do
  context 'fields' do
    it { is_expected.to respond_to :challenge_id }
    it { is_expected.to respond_to :challenge_round }
    it { is_expected.to respond_to :start_dttm }
    it { is_expected.to respond_to :end_dttm }
    it { is_expected.to respond_to :submission_limit }
    it { is_expected.to respond_to :submission_limit_period_cd }
    it { is_expected.to respond_to :active }
  end

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
