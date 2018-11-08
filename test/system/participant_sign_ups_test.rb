require "application_system_test_case"

class ParticipantSignUpsTest < ApplicationSystemTestCase
  setup do
    @participant_sign_up = participant_sign_ups(:one)
  end

  test "visiting the index" do
    visit participant_sign_ups_url
    assert_selector "h1", text: "Participant Sign Ups"
  end

  test "creating a Participant sign up" do
    visit participant_sign_ups_url
    click_on "New Participant Sign Up"

    fill_in "Count", with: @participant_sign_up.count
    fill_in "Mnth", with: @participant_sign_up.mnth
    fill_in "Yr", with: @participant_sign_up.yr
    click_on "Create Participant sign up"

    assert_text "Participant sign up was successfully created"
    click_on "Back"
  end

  test "updating a Participant sign up" do
    visit participant_sign_ups_url
    click_on "Edit", match: :first

    fill_in "Count", with: @participant_sign_up.count
    fill_in "Mnth", with: @participant_sign_up.mnth
    fill_in "Yr", with: @participant_sign_up.yr
    click_on "Update Participant sign up"

    assert_text "Participant sign up was successfully updated"
    click_on "Back"
  end

  test "destroying a Participant sign up" do
    visit participant_sign_ups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Participant sign up was successfully destroyed"
  end
end
