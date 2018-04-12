require 'rails_helper'

RSpec.describe CalculateLeaderboardService do

  before do
    Timecop.freeze(DateTime.new(2018, 03, 15, 9, 0, 0, "+02:00"))
  end

  after do
    Timecop.return
  end


  # Submission | Partic | Score     | Secondary | Post?
  # -----------|--------|-----------|------------------
  #  p1s1      |  p1    | 30.050123 | 0.001999  |  No
  #  p1s2      |  p1    | 30.05     | 0.002     |  No
  #  p1s3      |  p1    | 32.05     | 0.001     |  No
  #  p1s4      |  p1    | 32.05     | 0.002     |  No
  #  p2s1      |  p2    | 31.00     | 0.003     |  No
  #  p2s2      |  p2    | 36.00     | 0.003     |  No
  #  p2s3      |  p2    | 40.00     | 0.005456  |  Yes


  # Leaderboard
  # Row | Submission | Partic | Primary | Secondary
  # ----|------------|--------|---------|----------
  #  1  |  p1s1      |  p1    |  30.05  |  0.001
  #  2  |  p2s1      |  p2    |  31.00  |  0.003

  # Ongoing Leaderboard
  # Rank | Submission | Partic | Primary | Secondary | Post?
  # -----|------------|--------|---------|-----------|------
  #  1   |  p1s1      |  p1    |  30.05  |  0.001    | No
  #  2   |  p2s1      |  p2    |  31.00  |  0.003    | No


  let!(:challenge) { create :challenge, :running }
  let!(:challenge_round) { challenge.challenge_rounds.first }
  let!(:participant1) { create :participant }
  let!(:participant2) { create :participant }
  let!(:p1s1) {
    create :submission,
    participant: participant1,
    challenge: challenge,
    challenge_round_id: challenge_round.id,
    grading_status: :graded,
    score: 30.050123,
    score_secondary: 0.001999 }
  let!(:p1s2) {
    create :submission,
    participant: participant1,
    challenge: challenge,
    challenge_round_id: challenge_round.id,
    grading_status: :graded,
    score: 30.05,
    score_secondary: 0.002 }
  let!(:p1s3) {
    create :submission,
    participant: participant1,
    challenge: challenge,
    challenge_round_id: challenge_round.id,
    grading_status: :graded,
    score: 32.05,
    score_secondary: 0.001 }
  let!(:p1s4) {
    create :submission,
    participant: participant1,
    challenge: challenge,
    challenge_round_id: challenge_round.id,
    grading_status: :graded,
    score: 32.05,
    score_secondary: 0.002 }
  let!(:p2s1) {
    create :submission,
    participant: participant2,
    challenge: challenge,
    challenge_round_id: challenge_round.id,
    grading_status: :graded,
    score: 31.00,
    score_secondary: 0.003 }
  let!(:p2s2) {
    create :submission,
    participant: participant2,
    challenge: challenge,
    challenge_round_id: challenge_round.id,
    grading_status: :graded,
    score: 36.00,
    score_secondary: 0.003 }
  let!(:p2s3) {
    create :submission,
    participant: participant2,
    challenge: challenge,
    challenge_round_id: challenge_round.id,
    grading_status: :graded,
    post_challenge: true,
    score: 40.00,
    score_secondary: 0.005456 }

  describe 'order by primary asc, secondary asc' do
    # Row | Submission | Participant | Primary | Secondary
    # ----|------------|-------------|---------|----------
    #  1  |  p1s1      |  p1         |  30.05  |  0.001
    #  2  |  p2s1      |  p2         |  31.00  |  0.003
    before do
      challenge.update(
        primary_sort_order: :ascending,
        secondary_sort_order: :ascending)
      described_class.new(
        challenge_round_id: challenge_round.id).call
    end

    it { expect(Leaderboard.count).to eq(2) }
    it { expect(OngoingLeaderboard.count).to eq(2) }
    it { expect(PreviousLeaderboard.count).to eq(0) }
    it { expect(PreviousOngoingLeaderboard.count).to eq(0) }

    it { expect(OngoingLeaderboard.count)
          .to eq(2) }
    it { expect(OngoingLeaderboard.first.participant_id)
          .to eq(participant1.id) }
    it { expect(OngoingLeaderboard.first.row_num)
          .to eq(1) }
    it { expect(OngoingLeaderboard.first.score)
          .to eq(30.05) }
    it { expect(OngoingLeaderboard.first.score_secondary)
          .to eq(0.001) }

    it { expect(OngoingLeaderboard.second.participant_id)
          .to eq(participant2.id) }
    it { expect(OngoingLeaderboard.second.row_num)
          .to eq(2) }
    it { expect(OngoingLeaderboard.second.score)
          .to eq(31.00) }
    it { expect(OngoingLeaderboard.second.score_secondary)
          .to eq(0.003) }
  end

  describe 'order by primary desc, secondary desc' do
    # Row | Submission | Participant | Primary | Secondary
    # ----|------------|-------------|---------|----------
    #  1  |  p2s3      |  p2         |  40.00  |  0.005
    #  2  |  p1s4      |  p1         |  32.05  |  0.002
    before do
      challenge.update(
        primary_sort_order: :descending,
        secondary_sort_order: :descending)
      described_class.new(
        challenge_round_id: challenge_round.id).call
    end

    it { expect(Leaderboard.count).to eq(2) }
    it { expect(OngoingLeaderboard.count).to eq(2) }
    it { expect(PreviousLeaderboard.count).to eq(0) }
    it { expect(PreviousOngoingLeaderboard.count).to eq(0) }

    it { expect(OngoingLeaderboard.first.participant_id)
          .to eq(participant2.id) }
    it { expect(OngoingLeaderboard.first.row_num)
          .to eq(1) }
    it { expect(OngoingLeaderboard.first.score)
          .to eq(40.00) }
    it { expect(OngoingLeaderboard.first.score_secondary)
          .to eq(0.005) }
    it { expect(OngoingLeaderboard.second.participant_id)
          .to eq(participant1.id) }

    it { expect(OngoingLeaderboard.second.row_num)
          .to eq(2) }
    it { expect(OngoingLeaderboard.second.score)
          .to eq(32.05) }
    it { expect(OngoingLeaderboard.second.score_secondary)
          .to eq(0.002) }
  end


  describe 'order by primary desc, secondary asc' do
    # Row | Submission | Participant | Primary | Secondary
    # ----|------------|-------------|---------|----------
    #  1  |  p2s2      |  p2         |  40.00  | 0.005
    #  2  |  p1s5      |  p1         |  32.05  | 0.001
    before do
      challenge.update(
        primary_sort_order: :descending,
        secondary_sort_order: :ascending)
      described_class.new(
        challenge_round_id: challenge_round.id).call
    end

    it { expect(Leaderboard.count).to eq(2) }
    it { expect(OngoingLeaderboard.count).to eq(2) }
    it { expect(PreviousLeaderboard.count).to eq(0) }
    it { expect(PreviousOngoingLeaderboard.count).to eq(0) }

    it { expect(OngoingLeaderboard.first.participant_id)
          .to eq(participant2.id) }
    it { expect(OngoingLeaderboard.first.row_num)
          .to eq(1) }
    it { expect(OngoingLeaderboard.first.score)
          .to eq(40.00) }
    it { expect(OngoingLeaderboard.first.score_secondary)
          .to eq(0.005) }

    it { expect(OngoingLeaderboard.second.participant_id)
          .to eq(participant1.id) }
    it { expect(OngoingLeaderboard.second.row_num)
          .to eq(2) }
    it { expect(OngoingLeaderboard.second.score)
          .to eq(32.05) }
    it { expect(OngoingLeaderboard.second.score_secondary)
          .to eq(0.001) }
  end

  describe 'order by primary asc, secondary desc' do
    # Row | Submission | Participant | Primary | Secondary
    # ----|------------|-------------|---------|----------
    #  1  |  p1s2      |  p1         |  30.05  | 0.002
    #  2  |  p2s1      |  p2         |  31.00  | 0.003
    before do
      challenge.update(
        primary_sort_order: :ascending,
        secondary_sort_order: :descending)
      described_class.new(
        challenge_round_id: challenge_round.id).call
    end

    it { expect(Leaderboard.count).to eq(2) }
    it { expect(OngoingLeaderboard.count).to eq(2) }
    it { expect(PreviousLeaderboard.count).to eq(0) }
    it { expect(PreviousOngoingLeaderboard.count).to eq(0) }

    it { expect(OngoingLeaderboard.first.participant_id)
          .to eq(participant1.id) }
    it { expect(OngoingLeaderboard.first.row_num)
          .to eq(1) }
    it { expect(OngoingLeaderboard.first.score)
          .to eq(30.05) }
    it { expect(OngoingLeaderboard.first.score_secondary)
          .to eq(0.002) }
    it { expect(OngoingLeaderboard.second.participant_id)
          .to eq(participant2.id) }
    it { expect(OngoingLeaderboard.second.row_num)
          .to eq(2) }
    it { expect(OngoingLeaderboard.second.score)
          .to eq(31.00) }
    it { expect(OngoingLeaderboard.second.score_secondary)
          .to eq(0.003) }
  end

end
