require 'rails_helper'

feature 'update participant data', js: true do

  let!(:participant) { create(:participant) }

  describe "participant profile" do
    before (:example) do
      participant = FactoryGirl.build(:participant)
    end

    scenario "a participant can upload their profile picture" do
      skip("spec to be coded")
    end

    scenario "a participant can reset their password" do
      skip("spec to be coded")
    end

    scenario "a participant can link their github id" do
      visit_own_profile(participant)
      find('#edit-participant-button').click
      fill_in "Github", with: 'https://github.com/atestgithubid'
      click_button 'Save'
      expect(page).to have_link 'Github'
    end

    scenario "a participant can link their Twitter id" do
      visit_own_profile(participant)
      find('#edit-participant-button').click
      fill_in "Twitter", with: 'https://twitter.com/sean75023232323218360'
      click_button 'Save'
      expect(page).to have_link 'Twitter'
    end

    scenario "a participant can link their LinkedIn Id" do
      visit_own_profile(participant)
      find('#edit-participant-button').click
      fill_in "Linkedin", with: 'https://ch.linkedin.com/in/testuser'
      click_button 'Save'
      expect(page).to have_link 'LinkedIn'
    end
  end
end
