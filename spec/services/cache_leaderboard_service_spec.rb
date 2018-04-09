require 'rails_helper'

RSpec.describe CacheLeaderboardService do

  describe '1 round challenge' do
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
      score: 30.05,
      score_secondary: 0.001 }
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
      score_secondary: 0.005 }
    let(:subject) { described_class.new(challenge_id: challenge.id) }

    # Submission | Participant | Score | Secondary | Post?
    # -----------|-------------|-------|------------------
    #  p1s1      |  p1         | 30.05 | 0.001     |  No
    #  p1s2      |  p1         | 30.05 | 0.002     |  No
    #  p1s3      |  p1         | 32.05 | 0.001     |  No
    #  p1s4      |  p1         | 32.05 | 0.002     |  No
    #  p2s1      |  p2         | 31.00 | 0.003     |  No
    #  p2s2      |  p2         | 36.00 | 0.003     |  No
    #  p2s3      |  p2         | 40.00 | 0.005     |  Yes

    context 'window_border_dttm' do
      it { expect(subject.window_border_dttm).not_to be_nil }
    end

    context 'most_recent_dttm' do
      it { expect(subject.window_border_dttm).not_to be_nil }
    end

    context 'call' do
      it { expect(subject.call).to be true }
    end
  end

end
