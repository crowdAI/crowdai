require 'rails_helper'

feature 'Email Preferences' do

  let!(:challenge) { create :challenge }
  let!(:participant) { create :participant }
  let!(:participant2) { create :participant }
  let!(:admin) { create :participant, :admin }

  describe "Accessing email preferences" do

    scenario "Participant can see their own Account Settings" do
      log_in(participant)
      visit '/participants/edit'
      expect(page).to have_content 'Account Settings'
    end

    scenario "Participant access their Email Notifications preferences" do
      log_in(participant)
      visit '/participants/edit'
      click_link 'Email Notifications'
      expect(page).to have_content 'Receive the crowdAI Newsletter'
    end

    scenario "Participant cannot access email preferences link for other participant" do
      log_in(participant)
      visit participant_path(participant2.slug)
      expect(page).not_to have_content 'Email Preferences'
    end

    scenario "Participant cannot directly access email preferences for other participant" do
      log_in(participant)
      other_url = "/participants/#{participant2.slug}/email_preferences/#{participant2.email_preferences.first.id}/edit"
      visit other_url
      expect(page).to have_content 'You are not authorised to access this page.'
    end

    scenario "Admin can access email preferences link for other participant" do
      log_in(admin)
      visit participant_path(participant2.slug)
      expect(page).to have_content 'Email Notifications'
      click_link 'Email Notifications'
      expect(page).to have_content 'Receive the crowdAI Newsletter'
    end

  end
end

=begin
  describe "Preference checkbox interdepencies" do

    scenario "'opt out of all' turns off all checkboxes" do
      visit_own_profile(participant)
      click_on 'Email preferences'
      check 'Opt out of all emails'
      #expect(find_by_id('#email_preference_opt_out_all')).to be_checked
      expect(1).to eq(1)
    end


    scenario "checking off one box checks off 'opt out all'" do
      #visit_own_profile(participant)
      #click_on 'Email preferences'
      expect(1).to eq(1)
    end

    scenario "checking off all boxes checks on 'opt out all'" do
      #visit_own_profile(participant)
      #click_on 'Email preferences'
      expect(1).to eq(1)
    end

  end
=end

=begin
  context 'Unsubscribe Token' do

    let!(:topic) { create :topic, challenge: challenge, participant: participant }
    let!(:post) { create :post, topic: topic, participant: participant }
    let!(:res) { PostNotificationMailer.new.sendmail(participant.id,post.id) }
    let!(:man) { MandrillSpecHelper.new(res) }

    scenario 'user is not logged in' do
      puts man.unsubscribe_url
      visit man.unsubscribe_url
      expect(page).to have_content 'Email Preferences'
    end

    it 'user is logged in' do

    end

    it 'token has expired' do
      #expect(page).to have_content('The unsubscribe link is invalid or expired.')
    end

    it "user is logged into a different account than the token's associated account" do
      #expect(page).to have_content('The unsubscribe link is invalid or expired.')
    end
  end
=end
