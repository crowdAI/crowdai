require 'rails_helper'

feature 'An organizer edits a challenge' do
  let!(:organizer) { create :organizer }
  let!(:participant) { create :participant, organizer: organizer }
  let!(:challenge) { create :challenge, organizer: organizer }

  scenario 'edit challenge' do
    log_in participant
    visit edit_organizer_challenge_path(challenge.organizer_id,challenge.slug)
    expect(page).to have_text 'Details'
    expect(page).to have_text 'Rounds'
    expect(page).to have_text 'Overview'
    expect(page).to have_text 'Submissions'
    expect(page).to have_text 'Winner'
    expect(page).not_to have_text 'Dynamic'

    fill_in "Challenge Title", with: 'something new'

    click_button 'UPDATE CHALLENGE'
    expect(page).to have_text "Challenge updated."
  end

end
