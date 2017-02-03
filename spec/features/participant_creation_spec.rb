require "rails_helper"



feature "participant creation", js: true do
  describe "successful participant registration" do

=begin
    scenario "with valid details" do
      participant = FactoryGirl.build(:participant)

      visit "/"
      click_link "Sign up"

      fill_in "participant_name",      with: participant.name
      fill_in "participant_email",     with: participant.email
      fill_in 'participant_password',  with: participant.password
      fill_in "Password confirmation", with: participant.password

      click_button "Get started"

      expect(page).to have_content("A message with a confirmation link has been sent to your email address.")
    end

    scenario "confirm email" do

      visit "/"
      click_link "Sign up"

      fill_in "name",                  with: 'test_participant'
      fill_in "Email",                 with: "test@example.com"
      fill_in 'participant_password',  with: "crowdai123"
      fill_in "Password confirmation", with: "crowdai123"

      click_button "Get started"

      current_email.click_link "Confirm my account"

      expect(page).to have_content("Your email address has been successfully confirmed.")
    end
=end



    scenario "participant's name must be unique" do
      FactoryGirl.create(:participant, name: 'Bill Hayden')
      participant = FactoryGirl.build(:participant, name: 'Bill Hayden')
      visit '/'
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
    before(:each) do
      visit new_participant_registration_path
    end

    scenario "blank fields" do
      visit "/"
      click_link "Sign up"
      click_button "Get started"
      expect(page).to have_content "can't be blank"
    end

=begin
    scenario "incorrect password confirmation" do
      click_link "Sign up"
      fill_in "participant_name",      with: "Joe Bloggs"
      fill_in "participant_email",     with: "email@example.com"
      fill_in 'participant_password',  with: "crowdai123"
      fill_in "Password confirmation", with: "crowdai122"
      click_button "Get started"
      expect(page).to have_content "doesn't match Password"
    end
=end

=begin
    scenario "invalid email" do
      click_link "Sign up"
      fill_in "participant_name", with: "Joe Bloggs"
      fill_in "participant_email", with: "invalid-email-for-testing"
      fill_in 'participant_password', with: "crowdai123"
      fill_in "Password confirmation", with: "crowdai123"
      click_button "Get started"
      expect(page).to have_content "is invalid"
    end
=end

=begin
    scenario "already registered email" do
      create(:participant, email: "test@example.com")
      click_link "Sign up"
      fill_in "participant_name", with: "Joe Bloggs"
      fill_in "participant_email", with: "test@example.com"
      fill_in 'participant_password', with: "password1234"
      fill_in "Password confirmation", with: "password1234"
      click_button "Get started"
      expect(page).to have_content "has already been taken"
    end

=end

=begin
    scenario "password too short" do
      click_link "Sign up"
      fill_in "participant_name", with: "Joe Bloggs"
      fill_in "participant_email", with: "test@example.com"
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
=end
  end
end
