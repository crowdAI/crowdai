require 'rails_helper'

RSpec.describe CalculateLeaderboardService do

  before do
    Timecop.freeze(
      DateTime.new(2018, 03, 15, 9, 0, 0, "+02:00"),
      nsec: 0)
  end

  after do
    Timecop.return
  end

  #  Sub  | Part | Score     | Secondary | Post? | Window  | Ago
  # ------|------|-----------|-------------------|---------|-----
  #  p1s1 |  p1  | 30.050123 | 0.001999  |  No   | Prev    | 52h
  #  p1s2 |  p1  | 30.05     | 0.001     |  No   | Prev    | 50h
  #  p1s3 |  p1  | 32.0501   | 0.001     |  No   | Current | 1m
  #  p1s4 |  p1  | 32.05     | 0.002     |  No   | Current | 20h
  #  p2s1 |  p2  | 31.00     | 0.003     |  No   | Prev    | 70h
  #  p2s2 |  p2  | 36.00     | 0.003     |  No   | Current |  5h


  let!(:challenge) { create :challenge, :running }
  let!(:challenge_round) { challenge.challenge_rounds.first }
  # Ranking Window = 48 hours
  let!(:participant1) { create :participant }
  let!(:participant2) { create :participant }
  let!(:p1s1) {
    create :submission,
      participant: participant1,
      challenge: challenge,
      challenge_round_id: challenge_round.id,
      grading_status: :graded,
      score: 30.050123,
      score_secondary: 0.001999,
      created_at: 52.hours.ago }
  let!(:p1s2) {
    create :submission,
      participant: participant1,
      challenge: challenge,
      challenge_round_id: challenge_round.id,
      grading_status: :graded,
      score: 30.0509,
      score_secondary: 0.001,
      created_at: 50.hours.ago }
  let!(:p1s3) {
    create :submission,
      participant: participant1,
      challenge: challenge,
      challenge_round_id: challenge_round.id,
      grading_status: :graded,
      score: 32.0501,
      score_secondary: 0.001,
      created_at: 1.minute.ago }
  let!(:p1s4) {
    create :submission,
      participant: participant1,
      challenge: challenge,
      challenge_round_id: challenge_round.id,
      grading_status: :graded,
      score: 32.05,
      score_secondary: 0.002,
      created_at: 20.hours.ago }
  let!(:p2s1) {
    create :submission,
      participant: participant2,
      challenge: challenge,
      challenge_round_id: challenge_round.id,
      grading_status: :graded,
      score: 31.00,
      score_secondary: 0.003,
      created_at: 70.hours.ago }
  let!(:p2s2) {
    create :submission,
      participant: participant2,
      challenge: challenge,
      challenge_round_id: challenge_round.id,
      grading_status: :graded,
      score: 36.00,
      score_secondary: 0.003,
      created_at: 5.hours.ago }

  describe 'counts and rounding' do
    before do
      challenge.update(
        primary_sort_order: :descending,
        secondary_sort_order: :descending)
      described_class.new(
        challenge_round_id: challenge_round.id).call
      p1s1.reload
      p1s2.reload
      p1s3.reload
      p1s4.reload
      p2s1.reload
      p2s2.reload
    end

    it { expect(Leaderboard.count).to eq(2) }
    it { expect(OngoingLeaderboard.count).to eq(2) }
    it { expect(PreviousLeaderboard.count).to eq(2) }
    it { expect(PreviousOngoingLeaderboard.count).to eq(2) }
    # it expect Leaderboard to equal OngoingLeaderboard
    # it expect PreviousLeaderboard to equal PreviousOngoingLeaderboard

    # rounding
    it { expect(p1s1.score_display).to eq(30.05) }
    it { expect(p1s1.score_secondary_display).to eq(0.002) }
    it { expect(p1s2.score_display).to eq(30.051) }
    it { expect(p1s3.score_display).to eq(32.05)}
  end


  describe 'order by primary desc, secondary desc' do
    # Leaderboard
    # Row | Submission | Part | Primary | Secondary | Entries
    # ----|------------|------|---------|-----------|--------
    #  1  |  p2s2      |  p2  |  36.00  |  0.003    |    4
    #  2  |  p1s4      |  p1  |  32.05  |  0.002    |    2

    # Previous Leaderboard
    # Row | Submission | Part | Primary  | Secondary | Entries
    # ----|------------|------|----------|-----------|--------
    #  1  |  p2s1      |  p2  |  31.00   |  0.003    |   1
    #  2  |  p1s2      |  p1  |  30.051  |  0.002    |   2
    before do
      challenge.update(
        primary_sort_order: :descending,
        secondary_sort_order: :descending)
      described_class.new(
        challenge_round_id: challenge_round.id).call
      p1s1.reload
      p1s2.reload
      p1s3.reload
      p1s4.reload
      p2s1.reload
      p2s2.reload
    end

    # leaderboard
    it { expect(Leaderboard.first.participant_id)
          .to eq(participant2.id) }
    it { expect(Leaderboard.first.row_num)
          .to eq(1) }
    it { expect(Leaderboard.first.score)
          .to eq(36.00) }
    it { expect(Leaderboard.first.score_secondary)
          .to eq(0.003) }
    it { expect(Leaderboard.first.entries)
          .to eq(2) }
    it { expect(Leaderboard.first.post_challenge)
          .to eq(false) }

    it { expect(Leaderboard.second.participant_id)
          .to eq(participant1.id) }
    it { expect(Leaderboard.second.row_num)
          .to eq(2) }
    it { expect(Leaderboard.second.score)
          .to eq(32.05) }
    it { expect(Leaderboard.second.score_secondary)
          .to eq(0.002) }
    it { expect(Leaderboard.second.entries)
          .to eq(4) }
    it { expect(Leaderboard.second.post_challenge)
          .to eq(false) }

    # previous leaderboard
    it { expect(PreviousLeaderboard.first.participant_id)
          .to eq(participant2.id) }
    it { expect(PreviousLeaderboard.first.row_num)
          .to eq(1) }
    it { expect(PreviousLeaderboard.first.score)
          .to eq(36.00) }
    it { expect(PreviousLeaderboard.first.score_secondary)
          .to eq(0.003) }
    it { expect(PreviousLeaderboard.first.post_challenge)
          .to eq(false) }

    it { expect(PreviousLeaderboard.second.participant_id)
          .to eq(participant1.id) }
    it { expect(PreviousLeaderboard.second.row_num)
          .to eq(2) }
    it { expect(PreviousLeaderboard.second.score)
          .to eq(32.05) }
    it { expect(PreviousLeaderboard.second.score_secondary)
          .to eq(0.002) }
    it { expect(PreviousLeaderboard.second.post_challenge)
          .to eq(false) }

  end

  describe 'order by primary asc, secondary asc' do
    # Leaderboard
    # Row | Submission | Part | Primary | Secondary | Entries
    # ----|------------|------|---------|-----------|---------
    #  1  |  p1s2      |  p1  |  30.05  |  0.001    |    4
    #  2  |  p2s1      |  p2  |  31.00  |  0.003    |    2

    # Previous Leaderboard
    # Row | Submission | Part | Primary | Secondary | Entries
    # ----|------------|------|---------|-----------|---------
    #  1  |  p1s1      |  p1  |  30.05  |  0.002    |    1
    #  2  |  p2s1      |  p2  |  31.00  |  0.003    |    2
    before do
      challenge.update(
        primary_sort_order: :ascending,
        secondary_sort_order: :ascending)
      described_class.new(
        challenge_round_id: challenge_round.id).call
      p1s1.reload
      p1s2.reload
      p1s3.reload
      p1s4.reload
      p2s1.reload
      p2s2.reload
    end

    # leaderboard
    it { expect(Leaderboard.first.participant_id)
          .to eq(participant1.id) }
    it { expect(Leaderboard.first.row_num)
          .to eq(1) }
    it { expect(Leaderboard.first.score)
          .to eq(30.05) }
    it { expect(Leaderboard.first.score_secondary)
          .to eq(0.002) }
    it { expect(Leaderboard.first.entries)
          .to eq(4) }
    it { expect(Leaderboard.first.post_challenge)
          .to eq(false) }

    it { expect(Leaderboard.second.participant_id)
          .to eq(participant2.id) }
    it { expect(Leaderboard.second.row_num)
          .to eq(2) }
    it { expect(Leaderboard.second.score)
          .to eq(31.00) }
    it { expect(Leaderboard.second.score_secondary)
          .to eq(0.003) }
    it { expect(Leaderboard.second.entries)
          .to eq(2) }
    it { expect(Leaderboard.second.post_challenge)
          .to eq(false) }

    # previous leaderboard
    it { expect(PreviousLeaderboard.first.participant_id)
          .to eq(participant1.id) }
    it { expect(PreviousLeaderboard.first.row_num)
          .to eq(1) }
    it { expect(PreviousLeaderboard.first.score)
          .to eq(30.05) }
    it { expect(PreviousLeaderboard.first.score_secondary)
          .to eq(0.001) }
    it { expect(PreviousLeaderboard.first.post_challenge)
          .to eq(false) }

    it { expect(PreviousLeaderboard.second.participant_id)
          .to eq(participant1.id) }
    it { expect(PreviousLeaderboard.second.row_num)
          .to eq(2) }
    it { expect(PreviousLeaderboard.second.score)
          .to eq(31.00) }
    it { expect(PreviousLeaderboard.second.score_secondary)
          .to eq(0.003) }
    it { expect(PreviousLeaderboard.second.post_challenge)
          .to eq(false) }

  end
end

=begin







  end

  describe 'order by primary desc, secondary desc' do
    # Row | Submission | Participant | Primary | Secondary
    # ----|------------|-------------|---------|----------
    #  1  |  p2s2      |  p2         |  36.00  |  0.003
    #  2  |  p1s4      |  p1         |  32.05  |  0.002
    before do
      challenge.update(
        primary_sort_order: :descending,
        secondary_sort_order: :descending)
      described_class.new(challenge_round_id: challenge_round.id).call
    end

    it { expect(Leaderboard.count).to eq(2) }
    it { expect(OngoingLeaderboard.count).to eq(2) }
    it { expect(PreviousLeaderboard.count).to eq(0) }
    it { expect(PreviousOngoingLeaderboard.count).to eq(0) }

    it { expect(Leaderboard.count)
          .to eq(2) }
    it { expect(Leaderboard.first.participant_id)
          .to eq(participant2.id) }
    it { expect(Leaderboard.first.row_num)
          .to eq(1) }
    it { expect(Leaderboard.first.score)
          .to eq(36.00) }
    it { expect(Leaderboard.first.score_secondary)
          .to eq(0.003) }
    it { expect(Leaderboard.second.participant_id)
          .to eq(participant1.id) }
    it { expect(Leaderboard.second.row_num)
          .to eq(2) }
    it { expect(Leaderboard.second.score)
          .to eq(32.05) }
    it { expect(Leaderboard.second.score_secondary)
          .to eq(0.002) }
  end

  describe 'order by primary desc, secondary asc' do
    # Row | Submission | Participant | Primary | Secondary
    # ----|------------|-------------|---------|----------
    #  1  |  p2s2      |  p2         |  36.00  | 0.003
    #  2  |  p1s5      |  p1         |  32.05  | 0.001
    before do
      challenge.update(
        primary_sort_order: :descending,
        secondary_sort_order: :ascending)
      described_class.new(challenge_round_id: challenge_round.id).call
    end

    it { expect(Leaderboard.count).to eq(2) }
    it { expect(OngoingLeaderboard.count).to eq(2) }
    it { expect(PreviousLeaderboard.count).to eq(0) }
    it { expect(PreviousOngoingLeaderboard.count).to eq(0) }

    it { expect(Leaderboard.first.participant_id)
          .to eq(participant2.id) }
    it { expect(Leaderboard.first.row_num)
          .to eq(1) }
    it { expect(Leaderboard.first.score)
          .to eq(36.00) }
    it { expect(Leaderboard.first.score_secondary)
          .to eq(0.003) }

    it { expect(Leaderboard.second.participant_id)
          .to eq(participant1.id) }
    it { expect(Leaderboard.second.row_num)
          .to eq(2) }
    it { expect(Leaderboard.second.score)
          .to eq(32.05) }
    it { expect(Leaderboard.second.score_secondary)
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
      described_class.new(challenge_round_id: challenge_round.id).call
    end

    it { expect(Leaderboard.count).to eq(2) }
    it { expect(OngoingLeaderboard.count).to eq(2) }
    it { expect(PreviousLeaderboard.count).to eq(0) }
    it { expect(PreviousOngoingLeaderboard.count).to eq(0) }

    it { expect(Leaderboard.count)
          .to eq(2) }
    it { expect(Leaderboard.first.participant_id)
          .to eq(participant1.id) }
    it { expect(Leaderboard.first.row_num)
          .to eq(1) }
    it { expect(Leaderboard.first.score)
          .to eq(30.05) }
    it { expect(Leaderboard.first.score_secondary)
          .to eq(0.002) }
    it { expect(Leaderboard.second.participant_id)
          .to eq(participant2.id) }
    it { expect(Leaderboard.second.row_num)
          .to eq(2) }
    it { expect(Leaderboard.second.score)
          .to eq(31.00) }
    it { expect(Leaderboard.second.score_secondary)
          .to eq(0.003) }
  end

end
=end
