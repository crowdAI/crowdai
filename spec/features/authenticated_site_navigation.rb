require 'rails_helper'

feature "site navigation for signed in participant", js: true do

  let!(:challenge) { create(:challenge, :with_events) }
  let!(:participant) { create(:participant) }

  # http://ios-driver.github.io/ios-driver/?page=native
  # https://github.com/appium/appium_capybara


  describe "authenticated landing page" do
    before(:example) do
      visit_landing_page
    end
    specify { expect(page).to have_content challenge.challenge }
    specify { expect(page).to have_link 'Knowledge Base' }
    specify { expect(page).to have_link 'Challenges' }
    specify { expect(page).not_to have_link 'admin' }
    specify { expect(page).to have_link participant.name }
  end


  describe "challenge page" do
    before(:example) do
      visit_challenge(challenge)
    end
    specify { expect(page).to have_content challenge.challenge.upcase }
    specify { expect(page).to have_link 'Overview' }
    specify { expect(page).to have_link 'Rules' }
    specify { expect(page).to have_link 'Prizes' }
    specify { expect(page).to have_link 'Resources' }
    specify { expect(page).to have_link 'Leaderboard' }
    specify { expect(page).to have_link 'Discussion' }
    specify { expect(page).to have_link 'Dataset' }
    specify { expect(page).to have_link 'Submit Entry' }
    specify { expect(page).not_to have_link 'Edit' }
  end

  describe "challenge page links" do
    scenario "follow Overvew link" do
      visit_challenge(challenge)
      click_link "Overview"
      expect(page).to have_content 'Overview'
    end

    scenario "follow Rules link" do
      visit_challenge(challenge)
      click_link "Rules"
      expect(page).to have_content 'Rules'
    end

    scenario "follow Prizes link" do
      visit_challenge(challenge)
      click_link "Prizes"
      expect(page).to have_content 'Prizes'
    end

    scenario "follow Resources link" do
      visit_challenge(challenge)
      click_link "Resources"
      expect(page).to have_content 'Resources'
    end

    scenario "follow Leaderboard link" do
      visit_challenge(challenge)
      click_link "Leaderboard"
      expect(page).to have_css '.leaderboard'
    end

    scenario "follow Discussion link" do
      visit_challenge(challenge)
      click_link "Discussion"
      expect(page).to have_css '.topics-table'
    end

    scenario "follow Dataset link" do
      visit_challenge(challenge)
      click_link "Dataset"
      expect(page).to have_text 'All images are released under the Creative Commons'
    end

    scenario "follow Submit Entry link" do
      visit_challenge(challenge)
      click_link "Submit Entry"
      expect(page).to have_link 'Submit Entry'
    end
  end

  describe "own profile page" do
    before(:example) do
      visit_own_profile
    end
    specify { expect(page).to have_content participant.name }
    specify { expect(page).to have_content 'online now' }
    specify { expect(page).to have_link 'Challenges' }
    specify { expect(page).to have_link 'Notebooks' }
    specify { expect(page).to have_link 'Activity' }
  end

  describe "profile page links" do
    scenario "click Challenges tab" do
      visit_own_profile
      find("#challenges").click
      expect(page).to have_content "#{participant.name} has not yet entered any challenges."
    end

    scenario "click Notebooks tab" do
      visit_own_profile
      click_link "Notebooks"
      expect(page).to have_content "#{participant.name} has not yet created any notebooks."
    end

    scenario "click Activity tab" do
      visit_own_profile
      click_link "Activity"
      expect(page).to have_content "#{participant.name} has not yet made any posts."
    end
  end


    describe "page footer links" do
      scenario "contact us link" do
        visit_challenge(challenge)
        click_link "Contact us"
        expect(page).to have_text("At crowdAI we would love to hear from you.")
      end

      scenario "privacy link" do
        visit_challenge(challenge)
        click_link "Privacy"
        expect(page).to have_text("In order to receive information about your Personal Data, the purposes and the parties the Data is shared with, contact the Owner.")
      end

      scenario "terms of service" do
        visit_challenge(challenge)
        click_link "Terms of Service"
        expect(page).to have_text("The following terms and conditions govern all use of the crowdAI.org website and all content, services, and products available at or through the website")
      end

      scenario "twitter link" do
        visit_challenge(challenge)
        find(".fa-twitter").click
        expect(page).to have_content "@crowd_ai"
      end
    end

end
