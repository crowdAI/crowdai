require 'rails_helper'

feature 'Email Preferences' do
  let!(:participant) { create(:participant) }
  3.times do |i|
    let!("challenge_#{i + 1}") { create :challenge }
  end

  context 'open menu' do
    scenario do
      log_in(participant)
      open_menu
      expect(page).to have_link participant.name
      expect(page).to have_link 'Profile'
      expect(page).to have_link 'Account Settings'
      expect(page).to have_link 'Log Out'
    end
  end

  context 'follow Profile link' do
    scenario do
      log_in(participant)
      open_menu
      within 'div#user-container' do
        click_link 'Profile'
      end
      expect(page).to have_text 'Edit Profile'
    end
  end

end
