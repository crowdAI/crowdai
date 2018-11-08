require "application_system_test_case"

class ChallengeRegistrationsTest < ApplicationSystemTestCase
  setup do
    @challenge_registration = challenge_registrations(:one)
  end

  test "visiting the index" do
    visit challenge_registrations_url
    assert_selector "h1", text: "Challenge Registrations"
  end

  test "creating a Challenge registration" do
    visit challenge_registrations_url
    click_on "New Challenge Registration"

    fill_in "Challenge", with: @challenge_registration.challenge_id
    fill_in "Clef Task", with: @challenge_registration.clef_task_id
    fill_in "Participant", with: @challenge_registration.participant_id
    fill_in "Registration Type", with: @challenge_registration.registration_type
    click_on "Create Challenge registration"

    assert_text "Challenge registration was successfully created"
    click_on "Back"
  end

  test "updating a Challenge registration" do
    visit challenge_registrations_url
    click_on "Edit", match: :first

    fill_in "Challenge", with: @challenge_registration.challenge_id
    fill_in "Clef Task", with: @challenge_registration.clef_task_id
    fill_in "Participant", with: @challenge_registration.participant_id
    fill_in "Registration Type", with: @challenge_registration.registration_type
    click_on "Update Challenge registration"

    assert_text "Challenge registration was successfully updated"
    click_on "Back"
  end

  test "destroying a Challenge registration" do
    visit challenge_registrations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Challenge registration was successfully destroyed"
  end
end
