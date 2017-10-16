require 'rails_helper'

RSpec.describe ChallengeRound, type: :model do
  context 'fields' do
    it { is_expected.to respond_to :challenge_id }
    it { is_expected.to respond_to :challenge_round }
    it { is_expected.to respond_to :start_date }
    it { is_expected.to respond_to :end_date }
    it { is_expected.to respond_to :start_time }
    it { is_expected.to respond_to :end_time }
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

  context 'callbacks' do
    describe 'set start and end times' do
      let(:challenge_round) { create :challenge_round }
      it { expect(challenge_round.start_dttm).to eq(challenge_round.start_date.to_datetime + challenge_round.start_time.seconds_since_midnight.seconds) }
      it { expect(challenge_round.end_dttm).to eq(challenge_round.end_date.to_datetime + challenge_round.end_time.seconds_since_midnight.seconds) }
    end
    describe 'update start and end times' do
      let!(:challenge_round) { create :challenge_round }
      before do
        challenge_round.update(start_date: 2.days.ago)
        challenge_round.update(start_time: 2.hours.ago)
        challenge_round.update(end_date: 2.days.since)
        challenge_round.update(start_time: 2.hours.since)
      end
      it { expect(challenge_round.start_dttm).to eq(challenge_round.start_date.to_datetime + challenge_round.start_time.seconds_since_midnight.seconds) }
      it { expect(challenge_round.end_dttm).to eq(challenge_round.end_date.to_datetime + challenge_round.end_time.seconds_since_midnight.seconds) }
    end
  end
end
