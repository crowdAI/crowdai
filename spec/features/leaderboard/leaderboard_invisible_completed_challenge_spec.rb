require 'rails_helper'

feature "leaderboard invisible challenge completed" do
  let!(:organizer) { create :organizer }
  let!(:org_participant) { create :participant, organizer_id: organizer.id }
  let!(:admin) { create :participant, :admin }
  let!(:challenge) {
    create :challenge,
    :completed,
    organizer_id: organizer.id,
    show_leaderboard: false,
    submissions_page: true
  }
  let(:participant) { create :participant }
  let(:other_participant) { create :participant }
  let!(:submission_1) {
      create :submission,
        challenge: challenge,
        participant: other_participant,
        grading_status_cd: 'graded',
        score: 100 }
  let!(:submission_2) {
      create :submission,
        challenge: challenge,
        participant: other_participant,
        grading_status_cd: 'graded',
        score: 99 }
  let!(:submission_3) {
      create :submission,
        challenge: challenge,
        participant: participant,
        grading_status_cd: 'graded',
        score: 98 }
  let!(:leaderboard) { CalculateLeaderboardService
    .new(
      challenge_round_id: challenge.challenge_rounds.first.id)
    .call }

  scenario 'public user' do
    visit "/challenges/#{challenge.slug}/leaderboards"
    expect(page).to have_content('Leaderboard is not displayed yet')
  end

  scenario 'participant' do
    log_in(participant)
    visit "/challenges/#{challenge.slug}/leaderboards"
    expect(page).to have_content('Leaderboard is not displayed yet')
  end

  scenario 'organizer', js: true do
    log_in(org_participant)
    visit "/challenges/#{challenge.slug}/leaderboards"
    expect(page).to have_content('Leaderboard is only visible to organizers')
    expect(page).to have_content('99')
    expect(page).to have_content('98')

    #click_link("#participant-link-#{other_participant.id}")
    #expect(page).to have_content('100')
  end

  scenario 'admin' do
    log_in(admin)
    visit "/challenges/#{challenge.slug}/leaderboards"
    expect(page).to have_content('Leaderboard is only visible to organizers')
    expect(page).to have_content('99')
    expect(page).to have_content('98')
  end

end
