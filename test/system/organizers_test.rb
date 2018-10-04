require "application_system_test_case"

class OrganizersTest < ApplicationSystemTestCase
  setup do
    @organizer = organizers(:one)
  end

  test "visiting the index" do
    visit organizers_url
    assert_selector "h1", text: "Organizers"
  end

  test "creating a Organizer" do
    visit organizers_url
    click_on "New Organizer"

    fill_in "Address", with: @organizer.address
    fill_in "Api Key", with: @organizer.api_key
    fill_in "Approved", with: @organizer.approved
    fill_in "Challenge Proposal", with: @organizer.challenge_proposal
    fill_in "Clef Organizer", with: @organizer.clef_organizer
    fill_in "Description", with: @organizer.description
    fill_in "Image File", with: @organizer.image_file
    fill_in "Organizer", with: @organizer.organizer
    fill_in "Slug", with: @organizer.slug
    fill_in "Tagline", with: @organizer.tagline
    click_on "Create Organizer"

    assert_text "Organizer was successfully created"
    click_on "Back"
  end

  test "updating a Organizer" do
    visit organizers_url
    click_on "Edit", match: :first

    fill_in "Address", with: @organizer.address
    fill_in "Api Key", with: @organizer.api_key
    fill_in "Approved", with: @organizer.approved
    fill_in "Challenge Proposal", with: @organizer.challenge_proposal
    fill_in "Clef Organizer", with: @organizer.clef_organizer
    fill_in "Description", with: @organizer.description
    fill_in "Image File", with: @organizer.image_file
    fill_in "Organizer", with: @organizer.organizer
    fill_in "Slug", with: @organizer.slug
    fill_in "Tagline", with: @organizer.tagline
    click_on "Update Organizer"

    assert_text "Organizer was successfully updated"
    click_on "Back"
  end

  test "destroying a Organizer" do
    visit organizers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Organizer was successfully destroyed"
  end
end
