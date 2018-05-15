require "rails_helper"

feature 'submissions not allowed' do
  let!(:running) { create :challenge, :running, online_submissions: true }
  let!(:draft) { create :challenge }
  let!(:starting_soon) {
    create :challenge, :starting_soon }
  let!(:completed_closed) {
    create :challenge,
      :completed,
      online_submissions: true,
      post_challenge_submissions: false }
  let(:participant) { create :participant }

  scenario 'public user' do
    visit new_challenge_submission_path(running)
    expect_sign_in
    visit new_challenge_submission_path(draft)
    expect_sign_in
    visit new_challenge_submission_path(starting_soon)
    expect_sign_in
    visit new_challenge_submission_path(completed_closed)
    expect_sign_in
  end

  scenario 'participant' do
    log_in participant
    visit new_challenge_submission_path(draft)
    expect_unauthorized
    visit new_challenge_submission_path(starting_soon)
    expect_unauthorized
    visit new_challenge_submission_path(completed_closed)
    expect_unauthorized
  end
end

feature 'challenge running' do
  let!(:running) { create :challenge, :running, online_submissions: true }
  let(:participant) { create :participant }
  scenario do
    log_in participant
    visit new_challenge_submission_path(running)
    expect(page).to have_text 'Create Submission'
  end
end

feature 'challenge ended' do
  let!(:challenge) {
    create :challenge,
      :completed,
      online_submissions: true,
      post_challenge_submissions: true }
  let(:participant) { create :participant }
  scenario do
    log_in participant
    visit new_challenge_submission_path(challenge)
    expect(page).to have_text 'Create Submission'
    expect(page).to have_text 'This challenge is now completed. You may continue to make submissions and your entries will appear on the Ongoing Leaderboard.'
  end

  scenario do
    challenge.update(post_challenge_submissions: false)
    log_in participant
    visit new_challenge_submission_path(challenge)
    expect_unauthorized
  end
end
