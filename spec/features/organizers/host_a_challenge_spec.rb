require "rails_helper"
=begin
feature "host a challenge" do
  scenario "user vists host a challenge" do
    visit '/'
    click_link 'Host a Challenge'
    expect(page).to have_content("Use crowdAI to connect your open data with machine learning and data science specialists, who will unlock the knowledge in your data and deliver production-ready open source solutions.")
  end

  scenario "user opens challenge registration modal", js: true do
    visit '/landing_page/host'
    click_link 'Get Started'
    expect(page).to have_content("Interested in hosting a challenge?")
  end

  scenario "challenge registration incorrectly completed", js: true do
    participant = build(:participant)

    visit '/landing_page/host'
    click_link 'Get Started'
    fill_in "Contact name", with: participant.name
    fill_in "Email address", with: participant.email
    #save_and_open_page
    #click_button "submit"
    #expect(page).to have_content("error")
  end

  scenario "challenge registration correctly completed", js: true do

  end
end
=end
