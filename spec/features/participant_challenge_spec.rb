require "rails_helper"
require 'views/devise/devise_sessions_new'

RSpec.feature "participant challenges", type: :feature do
  before(:each) do
    @participant = create :participant
    @admin_participant = create :participant, :admin
    @challenge = create :challenge, :with_events
    @login_page = DeviseSessionsNew.new.visit_page.login(@participant)
    visit challenge_path(@challenge)
  end

  describe "basic challenge navigation" do
    scenario "main page links" do
      click_link "Overview"
      expect(page).to have_text("Overview")
      click_link "Rules"
      expect(page).to have_text("Rules")
      click_link "Prizes"
      expect(page).to have_text("Prizes")
      click_link "Resources"
      expect(page).to have_text("Resources")
    end

    scenario "leaderboard links" do
      click_link "Leaderboard"
      expect(page).to have_text("Entries column includes entries not yet graded which, when graded, may affect the contents of this leaderboard.")
    end

    scenario "discussion link" do
      click_link "Discussion"
      expect(page).to have_link('+ New Topic')
    end

    scenario "dataset link" do
      click_link "Dataset"
      expect(page).to have_text("All images are released under the Creative Commons Attribution-ShareAlike")
    end

    scenario "a competitor can make a submission" do
      click_link "Submit Entry"
      page.find('.btn-block', text: 'Submit Entry').click
      expect(page).to have_text('By making your submission you indicate your agreement with these terms.')
    end
  end

  describe "page footer links" do
    scenario "contact us link" do
      click_link "Contact us"
      expect(page).to have_text("At crowdAI we would love to hear from you.")
    end

    scenario "privacy link" do
      click_link "Privacy"
      expect(page).to have_text("In order to receive information about your Personal Data, the purposes and the parties the Data is shared with, contact the Owner.")
    end

    scenario "terms of service" do
      click_link "Terms of Service"
      expect(page).to have_text("The following terms and conditions govern all use of the crowdAI.org website and all content, services, and products available at or through the website")
    end

    scenario "twitter link" do
      find(".fa-twitter").click
      expect(page).to have_text("@crowd_ai")
    end

  end
end
