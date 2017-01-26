require 'rails_helper'

=begin

feature 'update participant data', js: true do

  let!(:participant) { create(:participant) }

  describe "participant profile" do
    before (:example) do
      participant = FactoryGirl.build(:participant)
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

    scenario "a partipant can access their email preferences" do
      visit_own_profile(participant)
      click_link('Email preferences')
      expect(page).to have_selector(:link_or_button, 'Update Email Preferences')
    end


    scenario "email preference check boxes initial state" do
      visit_own_profile(participant)
      click_link('Email preferences')
      expect(find('#email_preference_opt_out_all').checked?).not_to be true
      expect(find('#email_preference_newsletter').checked?).to be true
      expect(find('#email_preference_my_leaderboard').checked?).to be true
      expect(find('#email_preference_any_post').checked?).to be true
      expect(find('#email_preference_my_topic_post').checked?).to be true
      expect(find('#email_preference_any_leaderboard').checked?).to be true
    end


    scenario "email preference check boxes uncheck and recheck all" do
      visit_own_profile(participant)
      click_link('Email preferences')
      expect(find('#email_preference_opt_out_all').checked?).not_to be true
      expect(find('#email_preference_newsletter').checked?).to be true
      expect(find('#email_preference_my_leaderboard').checked?).to be true
      expect(find('#email_preference_any_post').checked?).to be true
      expect(find('#email_preference_my_topic_post').checked?).to be true
      expect(find('#email_preference_any_leaderboard').checked?).to be true

      find('#email_preference_opt_out_all').click
      expect(find('#email_preference_opt_out_all').checked?).to be true
      expect(find('#email_preference_newsletter').checked?).not_to be true
      expect(find('#email_preference_my_leaderboard').checked?).not_to be true
      expect(find('#email_preference_any_post').checked?).not_to be true
      expect(find('#email_preference_my_topic_post').checked?).not_to be true
      expect(find('#email_preference_any_leaderboard').checked?).not_to be true

      find('#email_preference_opt_out_all').click
      expect(find('#email_preference_opt_out_all').checked?).not_to be true
      expect(find('#email_preference_newsletter').checked?).to be true
      expect(find('#email_preference_my_leaderboard').checked?).to be true
      expect(find('#email_preference_any_post').checked?).to be true
      expect(find('#email_preference_my_topic_post').checked?).to be true
      expect(find('#email_preference_any_leaderboard').checked?).to be true
    end


    scenario 'clicking "crowdAI Newsletter" after opt out all turns off opt out all' do
      visit_own_profile(participant)
      click_link('Email preferences')
      find('#email_preference_opt_out_all').click
      expect(find('#email_preference_newsletter').checked?).not_to be true

      find('#email_preference_newsletter').click
      expect(find('#email_preference_newsletter').checked?).to be true
      expect(find('#email_preference_opt_out_all').checked?).not_to be true
    end


    scenario 'clicking "A new entry is made on the leaderboard" after opt out all turns off opt out all' do
      visit_own_profile(participant)
      click_link('Email preferences')
      find('#email_preference_opt_out_all').click
      expect(find('#email_preference_my_leaderboard').checked?).not_to be true

      find('#email_preference_my_leaderboard').click
      expect(find('#email_preference_my_leaderboard').checked?).to be true
      expect(find('#email_preference_opt_out_all').checked?).not_to be true
    end

    scenario 'clicking "Any discussion post is made" after opt out all turns off opt out all' do
      visit_own_profile(participant)
      click_link('Email preferences')
      find('#email_preference_opt_out_all').click
      expect(find('#email_preference_any_post').checked?).not_to be true

      find('#email_preference_any_post').click
      expect(find('#email_preference_any_post').checked?).to be true
      expect(find('#email_preference_opt_out_all').checked?).not_to be true
    end

    scenario 'clicking "A post is made to a topic to which I am participating" after opt out all turns off opt out all' do
      visit_own_profile(participant)
      click_link('Email preferences')
      find('#email_preference_opt_out_all').click
      expect(find('#email_preference_my_topic_post').checked?).not_to be true

      find('#email_preference_my_topic_post').click
      expect(find('#email_preference_my_topic_post').checked?).to be true
      expect(find('#email_preference_opt_out_all').checked?).not_to be true
    end

    scenario 'clicking "A new entry is made on the leaderboard" after opt out all turns off opt out all' do
      visit_own_profile(participant)
      click_link('Email preferences')
      find('#email_preference_opt_out_all').click
      expect(find('#email_preference_any_leaderboard').checked?).not_to be true

      find('#email_preference_any_leaderboard').click
      expect(find('#email_preference_any_leaderboard').checked?).to be true
      expect(find('#email_preference_opt_out_all').checked?).not_to be true
    end
  end
end

=end
