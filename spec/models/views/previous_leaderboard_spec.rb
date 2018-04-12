require 'rails_helper'

RSpec.describe PreviousLeaderboard, type: :model do

  before do
    Timecop.freeze(DateTime.new(2017, 10, 15, 2, 2, 2, "+02:00"))
  end

  after do
    Timecop.return
  end

  context '1 round challenge' do
    let!(:challenge) {
      create :challenge,
      :running,
      ranking_window: 48
      }
    let!(:challenge_round) { challenge.challenge_rounds.first }
    let!(:participant1) { create :participant }
    let!(:participant2) { create :participant }
    let!(:p1s1) {
      create :submission,
      participant: participant1,
      challenge: challenge,
      challenge_round_id: challenge_round.id,
      grading_status: :graded,
      score: 30.05,
      score_secondary: 0.001,
      created_at: 85.hours.ago }
    let!(:p1s2) {
      create :submission,
      participant: participant1,
      challenge: challenge,
      challenge_round_id: challenge_round.id,
      grading_status: :graded,
      score: 30.05,
      score_secondary: 0.002,
      created_at: 84.hours.ago }
    let!(:p1s3) {
      create :submission,
      participant: participant1,
      challenge: challenge,
      challenge_round_id: challenge_round.id,
      grading_status: :graded,
      score: 32.05,
      score_secondary: 0.001,
      created_at: 83.hours.ago }
    let!(:p1s4) {
      create :submission,
      participant: participant1,
      challenge: challenge,
      challenge_round_id: challenge_round.id,
      grading_status: :graded,
      score: 32.05,
      score_secondary: 0.002,
      created_at: 5.hours.ago }
    let!(:p2s1) {
      create :submission,
      participant: participant2,
      challenge: challenge,
      challenge_round_id: challenge_round.id,
      grading_status: :graded,
      score: 31.00,
      score_secondary: 0.003,
      created_at: 90.hours.ago }
    let!(:p2s2) {
      create :submission,
      participant: participant2,
      challenge: challenge,
      challenge_round_id: challenge_round.id,
      grading_status: :graded,
      score: 40.00,
      score_secondary: 0.005,
      created_at: 2.hours.ago }


    # Submissions
    # Submission | Participant | Score | Secondary | Window
    # -----------|-------------|-------|------------------
    #  p1s1      |  p1         | 30.05 | 0.001     | Prev
    #  p1s2      |  p1         | 30.05 | 0.002     | Prev
    #  p1s3      |  p1         | 32.05 | 0.001     | Prev
    #  p2s1      |  p2         | 31.00 | 0.003     | Prev
    # -----------|-------------|-------|-----------|------
    #  p1s4      |  p1         | 32.05 | 0.002     | Curr
    #  p2s2      |  p2         | 40.00 | 0.005     | Curr

    # CurrentLeaderboard - (descending / descending)
    # Rank|  Sub | Participant | Score  | Secondary
    # ----|------|-------------|--------|-----------
    #  1  | p2s2 |      p2     |  40.00 |  0.005
    #  2  | p2s1 |      p2     |  32.05 |  0.002

    # PreviousLeaderboard
    # Rank |  Sub | Participant | Primary | Secondary
    # -----|------|-------------|---------|----------
    #  1   | p1s3 |     p2      |  32.05  |  0.001
    #  2   | p2s1 |     p2      |  31.00  |  0.003

    describe 'order by primary desc, secondary desc' do

      before do
        challenge.update(
          primary_sort_order: :descending,
          secondary_sort_order: :descending)
        Scenic.database.refresh_materialized_view(
          :previous_leaderboards,
          concurrently: false,
          cascade: false)
      end
      it { expect(CurrentLeaderboard.count)
            .to eq(2) }
      it { expect(CurrentLeaderboard.first.participant_id)
            .to eq(participant2.id) }
      it { expect(CurrentLeaderboard.first.row_num)
            .to eq(1) }
      it { expect(CurrentLeaderboard.first.score)
            .to eq(40.00) }
      it { expect(CurrentLeaderboard.first.score_secondary)
            .to eq(0.005) }
      it { expect(CurrentLeaderboard.second.participant_id)
            .to eq(participant1.id) }
      it { expect(CurrentLeaderboard.second.row_num)
            .to eq(2) }
      it { expect(CurrentLeaderboard.second.score)
            .to eq(32.05) }
      it { expect(CurrentLeaderboard.second.score_secondary)
            .to eq(0.002) }

      it { expect(PreviousLeaderboard.count)
            .to eq(2) }
      it { expect(PreviousLeaderboard.first.participant_id)
            .to eq(participant1.id) }
      it { expect(PreviousLeaderboard.first.row_num)
            .to eq(1) }
      it { expect(PreviousLeaderboard.first.score)
            .to eq(32.05) }
      it { expect(PreviousLeaderboard.first.score_secondary)
            .to eq(0.001) }
      it { expect(PreviousLeaderboard.second.participant_id)
            .to eq(participant2.id) }
      it { expect(PreviousLeaderboard.second.row_num)
            .to eq(2) }
      it { expect(PreviousLeaderboard.second.score)
            .to eq(31.00) }
      it { expect(PreviousLeaderboard.second.score_secondary)
            .to eq(0.003) }
    end
  end
end
