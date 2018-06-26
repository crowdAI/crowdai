  require 'rails_helper'

feature "challenge" do
  let!(:challenge) { create(:challenge, :running) }
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

    specify { expect(page).to have_link 'Log in' }
    specify { expect(page).to have_content challenge.challenge }
    specify { expect(page).to have_content challenge.tagline }
  end

  describe "anonymous participant" do
    before(:example) do
      visit '/'
      click_link challenge.challenge
    end

    scenario "can follow Overview link" do
      click_link "Overview"
      expect(page).to have_content 'Overview'
    end

    scenario "can follow Leaderboard link" do
      click_link "Leaderboard"
      expect(page).to have_content 'Leaderboard'
    end

    scenario "can follow Discussion link" do
      click_link "Discussion"
      expect(page).to have_content 'Discussion'
      click_link 'New Topic'
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end

    scenario "cannot follow Dataset link" do
      click_link "Dataset"
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end
  end

  describe "participant is required to log in to access restricted parts of the challenge" do
    before(:example) do
      visit '/'
      click_link challenge.challenge
    end

    scenario "follow Discussion link" do
      click_link "Discussion"
      expect(page).to have_content 'Discussion'
      click_link 'New Topic'
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end

    scenario "follow Dataset link" do
      click_link "Dataset"
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end

  end

  describe "anonymous participant cannot access restricted pages via url manipulation" do
    before(:example) do
      visit '/'
    end

    scenario "show for draft challenge" do
      visit "/challenges/#{draft_challenge.id}"
      expect(current_path).to eq('/participants/sign_in')
    end

    scenario "show for running challenge" do
      visit "/challenges/#{challenge.slug}"
      expect(current_path).to eq("/challenges/#{challenge.slug}")
    end

    scenario "edit challenge" do
      visit "/challenges/#{draft_challenge.id}/edit"
      expect(page).to have_content("Oh dear. The page you were looking for doesn't exist.")
    end

    scenario "new challenge" do
      visit "/challenges/new"
      expect(page).to have_content("Oh dear. The page you were looking for doesn't exist.")
    end
  end

end
