=begin
require "rails_helper"

def fill_out_account_creation_form
  participant = build(:participant)
  fill_in "Display name", with: participant.name
  fill_in "Email address", with: participant.email
  fill_in "Choose a password", with: participant.password
  fill_in "Re-type password", with: participant.password
end

def confirm_account
  participant = Participant.last
  visit participant_confirmation_url(confirmation_token: participant.confirmation_token)
end

def sign_up_and_confirm_account
  visit 'participants/sign_up'
  fill_out_account_creation_form
  click_button "Sign Up"
  confirm_account
end

feature "participant creates account" do
  scenario "enter sign up information" do
    visit 'participants/sign_up'
    expect(page).to have_content("One account per individual")

    fill_out_account_creation_form
    click_button "Sign Up"
    expect(page).to have_content "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account."
  end

  scenario "confirm account" do
    visit 'participants/sign_up'
    fill_out_account_creation_form
    click_button "Sign Up"

    confirm_account
    expect(page).to have_content "Your email address has been successfully confirmed."
  end
end
=end
