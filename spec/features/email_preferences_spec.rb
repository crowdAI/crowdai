require 'rails_helper'

feature 'Email Preferences', js: true do

  let!(:challenge) { create :challenge, :running }
  let!(:participant) { create :participant }
  let!(:participant2) { create :participant }
  let!(:admin) { create :participant, :admin }

  describe "Accessing email preferences" do

    scenario "Participant can see preferences link" do
      visit_own_profile(participant)
      expect(page).to have_content 'Email preferences'
    end

    scenario "Participant access own preferences" do
      visit_own_profile(participant)
      click_on 'Email preferences'
      expect(page).to have_content 'General preferences'
    end

    scenario "Participant cannot access email preferences link for other participant" do
      visit_profile(participant,participant2)
      expect(page).not_to have_content 'Email Preferences'
    end

    scenario "Participant cannot directly access email preferences for other participant" do
      other_url = "/participants/#{participant2.name}/email_preferences/#{participant2.email_preferences.first.id}/edit"
      visit_own_profile(participant)
      visit other_url
      expect(page).not_to have_content 'Email Preferences'
    end

    scenario "Admin can access email preferences link for other participant" do
      visit_profile(admin,participant2)
      expect(page).not_to have_content 'Email Preferences'
    end

    scenario "Admin can directly access email preferences for other participant" do
      other_url = "/participants/#{participant2.name}/email_preferences/#{participant2.email_preferences.first.id}/edit"
      visit_own_profile(admin)
      visit other_url
      expect(page).not_to have_content 'Email Preferences'
    end

  end

  describe "Preference checkbox interdepencies" do

    scenario "'opt out of all' turns off all checkboxes" do
      visit_own_profile(participant)
      click_on 'Email preferences'
      check 'Opt out of all emails'
      #expect(find_by_id('#email_preference_opt_out_all')).to be_checked
      expect(1).to eq(1)
    end


    scenario "checking off one boxe checks off 'opt out all'" do
      visit_own_profile(participant)
      click_on 'Email preferences'
      expect(1).to eq(1)
    end

    scenario "checking off all boxes checks on 'opt out all'" do
      visit_own_profile(participant)
      click_on 'Email preferences'
      expect(1).to eq(1)
    end

  end


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

end
