require 'rails_helper'

feature "participant accesses challenge", js: true do
  let!(:challenge) { create(:challenge) }
  let!(:draft_challenge) { create(:challenge, :draft) }
  let!(:participant) { create(:participant) }

  describe "anonymous participant can view challenges list" do
    before(:example) do
      visit '/'
    end
    specify { expect(page).to have_link challenge.challenge }
    specify { expect(page).to have_link 'Log in' }
    specify { expect(page).to have_link 'Sign up' }
    specify { expect(page).to have_link 'Knowledge Base' }
    specify { expect(page).to have_link 'Challenges' }
  end


  describe "anonymous participant can view some challenges details" do
    before(:example) do
      visit '/'
      click_link challenge.challenge
    end

    # specify { expect(page).to have_link 'Log in' }
    specify { expect(page).to have_content 'DASHBOARD' }
    specify { expect(page).to have_content challenge.challenge.upcase }
    specify { expect(page).to have_content challenge.tagline }
  end

  describe "anonymous participant can follow public links (anchors)" do
    before(:example) do
      visit '/'
      click_link challenge.challenge
    end

    scenario "can follow Overvew link" do
      click_link "Overview"
      expect(page).to have_content 'Overview'
    end

    scenario "can follow Rules link" do
      click_link "Rules"
      expect(page).to have_content 'Rules'
    end

    scenario "can follow Prizes link" do
      click_link "Prizes"
      expect(page).to have_content 'Prizes'
    end

    scenario "can follow Resources link" do
      click_link "Resources"
      expect(page).to have_content 'Resources'
    end
  end

  describe "participant is required to log in to access restricted parts of the challenge" do
    before(:example) do
      visit '/'
      click_link challenge.challenge
    end

    scenario "follow Leaderboard link" do
      click_link "Leaderboard"
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end

    scenario "follow Discussion link" do
      click_link "Discussion"
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end

    scenario "follow Dataset link" do
      click_link "Dataset"
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end

    scenario "follow Submit Entry link" do
      click_link "Submit Entry"
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end
  end

  describe "anonymous participant cannot access restricted pages via url manipulation" do
    before(:example) do
      visit '/'
    end

    scenario "show for draft challenge" do
      visit "/challenges/#{draft_challenge.id}"
      expect(current_path).to eq('/')
    end

    scenario "show for running challenge" do
      visit "/challenges/#{challenge.id}"
      expect(current_path).to eq("/challenges/#{challenge.id}")
    end

    scenario "edit challenge" do
      visit "/challenges/#{draft_challenge.id}/edit"
      expect(current_path).to eq('/')
    end

    scenario "new challenge" do
      visit "/challenges/new"
      expect(current_path).to eq('/')
    end

  end

  describe "participant is taken to the resource after logging in" do
    before(:example) do
      visit '/'
      click_link challenge.challenge
    end

    scenario "follow Leaderboard link" do
      click_link "Leaderboard"
      fill_in 'Email address', with: participant.email
      fill_in 'Password', with: participant.password
      click_button 'Log in'
      expect(page).to have_css '.leaderboard'
    end

    scenario "follow Discussion link" do
      click_link "Discussion"
      fill_in 'Email address', with: participant.email
      fill_in 'Password', with: participant.password
      click_button 'Log in'
      expect(page).to have_css '.topics-table'
    end

    scenario "follow Dataset link" do
      click_link "Dataset"
      fill_in 'Email address', with: participant.email
      fill_in 'Password', with: participant.password
      click_button 'Log in'
      expect(page).to have_text Sanitize.clean(challenge.license)
    end

    scenario "follow Submit Entry link" do
      click_link "Submit Entry"
      fill_in 'Email address', with: participant.email
      fill_in 'Password', with: participant.password
      click_button 'Log in'
      expect(page).to have_link 'Submit Entry'
    end
  end



end
