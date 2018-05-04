feature 'An organizer creates a challenge' do
  let!(:organizer) { create :organizer }
  let!(:participant) { create :participant, organizer: organizer }
  let(:valid_attributes) { build :challenge, :running }

  before do
    log_in(participant)
  end

  scenario 'access create challenge button' do
    visit organizer_path(organizer, wait: 1)
    expect(page).to have_text organizer.organizer
    expect(page).to have_selector '.btn', text: 'Create Challenge'
  end

  scenario 'create challenge with valid attributes', js: true do
    visit organizer_path(organizer, wait: 1)
    click_on 'Create Challenge'
    expect(page).to have_text 'New Challenge'
    expect(page).to have_selector '.btn', text: 'CREATE CHALLENGE'

    fill_in "Challenge Title", with: valid_attributes.challenge
    fill_in "Tagline", with: valid_attributes.tagline

    click_on 'Create Challenge'
  #  expect(page).to have_text valid_attributes.challenge.upcase
    #expect(page).to have_selector '.btn', text: 'UPDATE CHALLENGE'
  end

  scenario 'a challenge organizer cannot change challenge status' do

  end

  #scenario 'and a Challenge record is created' do
  #  visit
  #end

  #scenario 'sees errors if details are incomplete' do
  #  visit edit_challenge_path(tab: 'details')
  #  submit_form

  #end
end
