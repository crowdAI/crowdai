require "rails_helper"

feature 'API key visibility' do
  let(:participant) { create :participant }
  let(:admin) { create :participant, :admin }

  scenario "API key visible on participant's own profile" do
    log_in(participant)
    visit participant_path(participant.slug)
    expect(participant.api_key).not_to be_nil
    expect(page).to have_content participant.api_key
  end

  scenario "API key visible to admin users" do
    log_in(admin)
    visit participant_path(participant.slug)
    expect(participant.api_key).not_to be_nil
    expect(page).to have_content participant.api_key
  end

  scenario "API key not visible to public users" do
    visit participant_path(participant.slug)
    expect(participant.api_key).not_to be_nil
    expect(page).not_to have_content participant.api_key
  end
end

=begin
feature 'Email field visibility', js: true do
  let(:participant) { create :participant }
  let(:admin) { create :participant, :admin }

  scenario "Email address is not visible on participant's own profile" do
    log_in(participant)
    visit participant_path(participant.slug)
    expect(participant.email).not_to be_nil
    expect(page).not_to have_content participant.email
  end

  scenario "Email key visible to admin users" do
    log_in(admin)
    visit participant_path(participant.slug)
    expect(page).to have_content participant.email
  end

  scenario "API key not visible to public users" do
    visit participant_path(participant.slug)
    expect(participant.api_key).not_to be_nil
    expect(page).not_to have_content participant.email
  end

  scenario "draft challenges not visible to public users" do
    TODO
  end
end
=end
