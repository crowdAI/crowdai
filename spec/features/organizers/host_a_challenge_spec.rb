require "rails_helper"

feature "host a challenge" do
  scenario "user vists host a challenge" do
    visit '/'
    click_button 'Host a Challenge'
    expect(page).to have_content("Use crowdAI to connect your open data with machine learning and data science specialists, who will unlock the knowledge in your data and deliver production-ready open source solutions.")
  end

  scenario "user opens challenge registration modal", js: true do
    visit '/landing_page/host'
    click_button 'Get Started'
    expect(page).to have_content("")
  end

  scenario "challenge registration incorrectly completed", js: true do

  end

  scenario "challenge registration correctly completed", js: true do

  end

  end
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


def visit_host_a_challenge
  visit '/'


end


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
