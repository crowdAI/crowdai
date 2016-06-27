require "rails_helper"
#require 'capybara/email/rspec'

feature "participant creation", js: true do
  describe "successful participant registration" do
    scenario "with valid details" do
      visit "/"
      click_link "Sign up"

      fill_in "name",                  with: 'test_participant'
      fill_in "Email",                 with: "test@example.com"
      fill_in 'participant_password',  with: "crowdai123"
      fill_in "Password confirmation", with: "crowdai123"

      click_button "Get started"

      expect(page).to have_content("A message with a confirmation link has been sent to your email address.")
    end

    scenario "confirm email" do
      open_email "test@example.com"
      current_email.click_link "Confirm my account"

      expect(page).to have_content("Your email address has been successfully confirmed.")

      fill_in "Login",      with: "test@example.com"
      fill_in "Password",   with: "crowdai123"
      click_link "Log in"

      expect(current_path).to eq "/"
      expect(page).to have_content "Welcome to CrowdAI"
    end

    scenario "participant's name must be unique" do
      FactoryGirl.create(:participant, name: 'Bill Hayden')
      participant = FactoryGirl.build(:participant, name: 'Bill Hayden')
      click_link "Sign up"
      fill_in "Display name", with: participant.name
      fill_in "Email", with: participant.email
      fill_in 'participant_password', with: participant.password
      fill_in "Password confirmation", with: participant.password_confirmation
      click_button "Get started"
      expect(page).to have_content "has already been taken"
    end
  end

  describe "unsuccessful participant registration" do
    before do
      visit new_participant_registration_path
    end

    scenario "blank fields" do
      visit "/"
      click_link "Sign up"
      click_button "Get started"
      expect(page).to have_content "can't be blank"
    end

    scenario "incorrect password confirmation" do
      click_link "Sign up"
      fill_in "Display name", with: "Joe Bloggs"
      fill_in "name", with: "test@example.com"
      fill_in 'participant_password', with: "crowdai123"
      fill_in "Password confirmation", with: "crowdai122"
      click_button "Get started"
      expect(page).to have_content "doesn't match Password"
    end

    scenario "invalid email" do
      click_link "Sign up"
      fill_in "Display name", with: "Joe Bloggs"
      fill_in "Email", with: "invalid-email-for-testing"
      fill_in 'participant_password', with: "crowdai123"
      fill_in "Password confirmation", with: "crowdai123"
      click_button "Get started"
      expect(page).to have_content "is invalid"
    end

    scenario "already registered email" do
      create(:participant, email: "test@example.com")
      click_link "Sign up"
      fill_in "Display name", with: "Joe Bloggs"
      fill_in "Email", with: "test@example.com"
      fill_in 'participant_password', with: "password1234"
      fill_in "Password confirmation", with: "password1234"
      click_button "Get started"
      expect(page).to have_content "has already been taken"
    end

    scenario "password too short" do
      click_link "Sign up"
      fill_in "Display name", with: "Joe Bloggs"
      fill_in "Email", with: "test@example.com"
      fill_in 'participant_password', with: "123456"
      fill_in "Password confirmation", with: "123456"
      click_button "Get started"
      expect(page).to have_content "is too short (minimum is 8 characters)"
    end

    scenario "participant's name must be at least 2 characters" do
      click_link "Sign up"
      fill_in "Display name", with: "J"
      fill_in "Email", with: "test@example.com"
      fill_in 'participant_password', with: "123456"
      fill_in "Password confirmation", with: "123456"
      click_button "Get started"
      expect(page).to have_content "is too short (minimum is 2 characters)"
    end
  end
end
