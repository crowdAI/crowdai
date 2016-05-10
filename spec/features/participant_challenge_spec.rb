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
end
