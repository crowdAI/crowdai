require 'spec_helper'

describe OngoingLeaderboard do
  context 'associations' do
    it { is_expected.to belong_to(:challenge) }
    it { is_expected.to belong_to(:participant) }
  end

  context '1 round challenge' do
    let!(:challenge) { create :challenge, :running }
    let!(:challenge_round) { challenge.challenge_rounds.first }
    let!(:participant1) { create :participant }
    let!(:participant2) { create :participant }
    let!(:p1s1) { create :submission, participant: participant1, challenge: challenge, challenge_round_id: challenge_round.id, grading_status: :graded,
                          score: 30.05, score_secondary: 0.0001 }
    let!(:p1s2) { create :submission, participant: participant1, challenge: challenge, challenge_round_id: challenge_round.id, grading_status: :graded,
                          score: 30.05, score_secondary: 0.0002 }
    let!(:p1s3) { create :submission, participant: participant1, challenge: challenge, challenge_round_id: challenge_round.id, grading_status: :graded,
                          score: 31.05, score_secondary: 0.0002 }
    let!(:p1s4) { create :submission, participant: participant1, challenge: challenge, challenge_round_id: challenge_round.id, grading_status: :graded,
                          score: 32.05, score_secondary: 0.0003 }
    let!(:p2s1) { create :submission, participant: participant2, challenge: challenge, challenge_round_id: challenge_round.id, grading_status: :graded,
                          score: 31.00, score_secondary: 0.0003 }
    let!(:p2s2) { create :submission, participant: participant2, challenge: challenge, challenge_round_id: challenge_round.id, grading_status: :graded,
                          score: 36.00, score_secondary: 0.0003 }

    describe 'order by primary asc, secondary asc' do
      before do
        challenge.update(primary_sort_order: :ascending, secondary_sort_order: :ascending)
      end
      it { expect(OngoingLeaderboard.count).to eq(2) }
      it { expect(OngoingLeaderboard.first.participant).to eq(participant1) }
      it { expect(OngoingLeaderboard.first.row_num).to eq(1) }
      it { expect(OngoingLeaderboard.first.score).to eq(30.05) }
      it { expect(OngoingLeaderboard.first.score_secondary).to eq(0.0001) }
      it { expect(OngoingLeaderboard.second.participant).to eq(participant2) }
      it { expect(OngoingLeaderboard.second.row_num).to eq(2) }
      it { expect(OngoingLeaderboard.second.score).to eq(31.00) }
      it { expect(OngoingLeaderboard.second.score_secondary).to eq(0.0003) }
    end

    describe 'order by primary desc, secondary asc' do
      before do
        challenge.update(primary_sort_order: :descending, secondary_sort_order: :ascending)
      end
      it { expect(OngoingLeaderboard.count).to eq(2) }
      it { expect(OngoingLeaderboard.first.participant).to eq(participant2) }
      it { expect(OngoingLeaderboard.first.row_num).to eq(1) }
      it { expect(OngoingLeaderboard.first.score).to eq(36.00) }
      it { expect(OngoingLeaderboard.first.score_secondary).to eq(0.0003) }
      it { expect(OngoingLeaderboard.second.participant).to eq(participant1) }
      it { expect(OngoingLeaderboard.second.row_num).to eq(2) }
      it { expect(OngoingLeaderboard.second.score).to eq(32.05) }
      it { expect(OngoingLeaderboard.second.score_secondary).to eq(0.0003) }
    end

    describe 'order by primary asc, secondary desc' do
      before do
        challenge.update(primary_sort_order: :ascending, secondary_sort_order: :descending)
      end
      it { expect(OngoingLeaderboard.count).to eq(2) }
      it { expect(OngoingLeaderboard.first.participant).to eq(participant1) }
      it { expect(OngoingLeaderboard.first.row_num).to eq(1) }
      it { expect(OngoingLeaderboard.first.score).to eq(30.05) }
      it { expect(OngoingLeaderboard.first.score_secondary).to eq(0.0002) }
      it { expect(OngoingLeaderboard.second.participant).to eq(participant2) }
      it { expect(OngoingLeaderboard.second.row_num).to eq(2) }
      it { expect(OngoingLeaderboard.second.score).to eq(31.00) }
      it { expect(OngoingLeaderboard.second.score_secondary).to eq(0.0003) }
    end
  end
end
