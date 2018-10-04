require "application_system_test_case"

class OrganizerApplicationsTest < ApplicationSystemTestCase
  setup do
    @organizer_application = organizer_applications(:one)
  end

  test "visiting the index" do
    visit organizer_applications_url
    assert_selector "h1", text: "Organizer Applications"
  end

  test "creating a Organizer application" do
    visit organizer_applications_url
    click_on "New Organizer Application"

    fill_in "Challenge Description", with: @organizer_application.challenge_description
    fill_in "Contact Name", with: @organizer_application.contact_name
    fill_in "Email", with: @organizer_application.email
    fill_in "Organization", with: @organizer_application.organization
    fill_in "Organization Description", with: @organizer_application.organization_description
    fill_in "Phone", with: @organizer_application.phone
    click_on "Create Organizer application"

    assert_text "Organizer application was successfully created"
    click_on "Back"
  end

  test "updating a Organizer application" do
    visit organizer_applications_url
    click_on "Edit", match: :first

    fill_in "Challenge Description", with: @organizer_application.challenge_description
    fill_in "Contact Name", with: @organizer_application.contact_name
    fill_in "Email", with: @organizer_application.email
    fill_in "Organization", with: @organizer_application.organization
    fill_in "Organization Description", with: @organizer_application.organization_description
    fill_in "Phone", with: @organizer_application.phone
    click_on "Update Organizer application"

    assert_text "Organizer application was successfully updated"
    click_on "Back"
  end

  test "destroying a Organizer application" do
    visit organizer_applications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Organizer application was successfully destroyed"
  end
end
