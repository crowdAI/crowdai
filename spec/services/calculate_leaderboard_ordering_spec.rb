require 'rails_helper'

RSpec.describe CalculateLeaderboardService do

  let(:challenge) { create :challenge, :running }
  let(:challenge_round) { challenge.challenge_rounds.first }

  describe 'descending / ascending' do
    before do
      challenge.update(
        primary_sort_order: :descending,
        secondary_sort_order: :descending)
    end
    it { expect(described_class.new(
      challenge_round_id: challenge_round.id)
      .get_order_by)
      .to eq('score_display desc, score_secondary_display desc')}
  end

  describe 'descending / not_used' do
    before do
      challenge.update(
        primary_sort_order: :descending,
        secondary_sort_order: :not_used)
    end
    it { expect(described_class.new(
      challenge_round_id: challenge_round.id)
      .get_order_by)
      .to eq('score_display desc')}
  end

  describe 'ascending / ascending' do
    before do
      challenge.update(
        primary_sort_order: :ascending,
        secondary_sort_order: :ascending)
    end
    it { expect(described_class.new(
      challenge_round_id: challenge_round.id)
      .get_order_by)
      .to eq('score_display asc, score_secondary_display asc')}
  end

  describe 'ascending / descending' do
    before do
      challenge.update(
        primary_sort_order: :ascending,
        secondary_sort_order: :descending)
    end
    it { expect(described_class.new(
      challenge_round_id: challenge_round.id)
      .get_order_by)
      .to eq('score_display asc, score_secondary_display desc')}
  end

  describe 'ascending / not_used' do
    before do
      challenge.update(
        primary_sort_order: :ascending,
        secondary_sort_order: :not_used)
    end
    it { expect(described_class.new(
      challenge_round_id: challenge_round.id)
      .get_order_by)
      .to eq('score_display asc')}
  end

  describe 'ascending / descending' do
    before do
      challenge.update(
        primary_sort_order: :descending,
        secondary_sort_order: :descending)
    end
    it { expect(described_class.new(
      challenge_round_id: challenge_round.id)
      .get_order_by)
      .to eq('score_display desc, score_secondary_display desc')}
  end

end
