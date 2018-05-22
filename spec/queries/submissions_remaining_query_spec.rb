require 'rails_helper'

RSpec.describe SubmissionsRemainingQuery do

  let!(:participant) { create :participant }
  let!(:subject) {
    described_class.new(
      challenge: challenge,
      participant_id: participant.id)
  }

  before do
    Timecop.freeze(DateTime.new(2017, 10, 30, 10, 0, 0, "UTC"))
  end

  describe 'does not fail when challenge is not setup' do
    let!(:challenge) { create :challenge, :draft }
    let!(:challenge_round) {
      create :challenge_round, challenge_id: challenge.id }
    it { expect(subject.call).to eq([1, nil, []]) }
  end

  describe 'per day' do
    let!(:challenge) { create :challenge, :day }

    context 'no submissions made' do
      it { expect(subject.call).to eq([5, nil, []]) }
    end

    context 'two submissions made inside window' do
      let!(:submission1) {
        create :submission,
          challenge: challenge,
          participant: participant,
          created_at: 4.hours.ago
      }
      let!(:submission2) {
        create :submission,
          challenge: challenge,
          participant: participant,
          created_at: 2.hours.ago
      }
      it { expect((subject.call)[0]).to eq(3) }
      it { expect((subject.call)[1]).to eq('2017-10-31 06:00:00 UTC') }
      it { expect((subject.call)[2].count).to eq(2) }
    end

    context 'two submissions made, one outside window' do
      let!(:submission1) {
        create :submission,
          challenge: challenge,
          participant: participant,
          created_at: 30.hours.ago
      }
      let!(:submission2) {
        create :submission,
          challenge: challenge,
          participant: participant,
          created_at: 4.hours.ago
      }
      it { expect((subject.call)[0]).to eq(4) }
      it { expect((subject.call)[1]).to eq('2017-10-31 06:00:00 UTC') }
      it { expect((subject.call)[2].count).to eq(1) }
    end

    context 'all submissions made' do
      5.times do |i|
        let!("submission_#{i + 1}") {
          create :submission,
            challenge: challenge,
            participant: participant,
            grading_message: "submission_#{i + 1}",
            created_at: (8 - i).hours.ago
        }
      end
      it { expect((subject.call)[0]).to eq(0) }
      it { expect((subject.call)[1]).
        to eq((submission_1.created_at + 1.day).to_s) }
      it { expect((subject.call)[2].count).to eq(5) }
    end
  end

  describe 'per week' do
    let!(:challenge) { create :challenge, :week }

    context 'no submissions made' do
      it { expect(subject.call).to eq([5, nil, []]) }
    end

    context 'two submissions made inside window' do
      let!(:submission1) {
        create :submission,
          challenge: challenge,
          participant: participant,
          created_at: 2.days.ago
      }
      let!(:submission2) {
        create :submission,
          challenge: challenge,
          participant: participant,
          created_at: 2.hours.ago
      }
      it { expect((subject.call)[0]).to eq(3) }
      it { expect((subject.call)[1]).to eq('2017-11-04 10:00:00 UTC') }
      it { expect((subject.call)[2].count).to eq(2) }
    end

    context 'two submissions made, one outside window' do
      let!(:submission1) {
        create :submission,
          challenge: challenge,
          participant: participant,
          created_at: 8.days.ago
      }
      let!(:submission2) {
        create :submission,
          challenge: challenge,
          participant: participant,
          created_at: 4.days.ago
      }
      it { expect((subject.call)[0]).to eq(4) }
      it { expect((subject.call)[1]).to eq('2017-11-02 10:00:00 UTC') }
      it { expect((subject.call)[2].count).to eq(1) }
    end

    context 'all submissions made' do
      5.times do |i|
        let!("submission_#{i + 1}") {
          create :submission,
            challenge: challenge,
            participant: participant,
            grading_message: "submission_#{i + 1}",
            created_at: (6 - i).days.ago
        }
      end
      it { expect((subject.call)[0]).to eq(0) }
      it { expect((subject.call)[1]).
        to eq((submission_1.created_at + 1.week).to_s) }
      it { expect((subject.call)[2].count).to eq(5) }
    end
  end

  describe 'per round' do
    let!(:challenge) {
      create :challenge,
      :round,
      created_at: 2.weeks.ago }
    let!(:round) { challenge.challenge_rounds.first }

    context 'no submissions made' do
      it { expect(subject.call).to eq([5, nil, []]) }
    end

    context 'round: two submissions made inside window' do
      let!(:submission1) {
        create :submission,
          challenge: challenge,
          challenge_round: round,
          participant: participant,
          created_at: 2.days.ago
      }
      let!(:submission2) {
        create :submission,
          challenge: challenge,
          challenge_round: round,
          participant: participant,
          created_at: 2.hours.ago
      }
      it { expect((subject.call)[0]).to eq(3) }
      it { expect((subject.call)[1]).to eq(nil) }
      it { expect((subject.call)[2].count).to eq(2) }
    end

    context 'round:two submissions made, one outside window' do
      let!(:round1) { challenge.challenge_rounds.first }
      let!(:submission1) {
        create :submission,
          challenge: challenge,
          participant: participant,
          created_at: round1.end_dttm - 1.day
      }
      let!(:submission2) {
        create :submission,
          challenge: challenge,
          participant: participant,
          created_at: 8.weeks.since
      }
      it { expect((subject.call)[0]).to eq(4) }
      it { expect((subject.call)[1]).to eq(nil) }
      it { expect((subject.call)[2].count).to eq(1) }
    end

    context 'all submissions made' do
      5.times do |i|
        let!("submission_#{i + 1}") {
          create :submission,
            challenge: challenge,
            participant: participant,
            grading_message: "submission_#{i + 1}",
            created_at: (6 - i).days.ago
        }
      end
      it { expect((subject.call)[0]).to eq(0) }
      it { expect((subject.call)[1]).to eq(nil) }
      it { expect((subject.call)[2].count).to eq(5) }
    end
  end

  Timecop.return

end
