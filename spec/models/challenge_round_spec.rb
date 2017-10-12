require 'rails_helper'

RSpec.describe ChallengeRound, type: :model do
  context 'fields' do
    it { is_expected.to respond_to :challenge_id }
    it { is_expected.to respond_to :challenge_round }
    it { is_expected.to respond_to :seq }
    it { is_expected.to respond_to :start_date }
    it { is_expected.to respond_to :end_date }
    it { is_expected.to respond_to :start_time }
    it { is_expected.to respond_to :end_time }
    it { is_expected.to respond_to :active }
  end

  context 'associations' do
    it { is_expected.to belong_to :challenge }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:challenge_round) }
    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:end_date) }
    it { is_expected.to validate_presence_of(:start_time) }
    it { is_expected.to validate_presence_of(:end_time) }
    it { should validate_uniqueness_of(:challenge_round).scoped_to(:challenge_id).case_insensitive }
    it { should validate_uniqueness_of(:start_date).scoped_to(:challenge_id).case_insensitive }
    it { should validate_uniqueness_of(:end_date).scoped_to(:challenge_id).case_insensitive }
  end

  context 'defaults' do
    describe 'leaderboard title defaults to "Leaderboard"' do
      let(:challenge_round) { create :challenge_round }
      it { expect(challenge_round.challenge_round).to eq('Round 1')}
    end
  end
end
