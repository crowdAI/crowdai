require 'rails_helper'

feature "Leaderboard" do

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


  let!(:challenge) { create :challenge }
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

  before do
    CalculateLeaderboardService.new(challenge_round_id: challenge_round.id).call
  end

    scenario 'public user' do
      visit "/challenges/#{challenge.slug}/leaderboards"
      #expect(page).to have_content '30.05'
      #expect(page).not_to have_content '30.050123'
      #expect(page).to have_content '0.001'
      #expect(page).not_to have_content '0.001999'
    end

    scenario 'participant' do
      #log_in(participant)
      #visit "/challenges/#{challenge.slug}/leaderboards"
      #expect(page).to have_content '30.05'
      ##expect(page).not_to have_content '30.050123'
      #expect(page).to have_content '0.001'
      #expect(page).not_to have_content '0.001999'
    end
end
