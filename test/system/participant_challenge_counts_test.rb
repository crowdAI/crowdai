require "application_system_test_case"

class ParticipantChallengeCountsTest < ApplicationSystemTestCase
  setup do
    @participant_challenge_count = participant_challenge_counts(:one)
  end

  test "visiting the index" do
    visit participant_challenge_counts_url
    assert_selector "h1", text: "Participant Challenge Counts"
  end

  test "creating a Participant challenge count" do
    visit participant_challenge_counts_url
    click_on "New Participant Challenge Count"

    fill_in "Challenge", with: @participant_challenge_count.challenge_id
    fill_in "Participant", with: @participant_challenge_count.participant_id
    fill_in "Registration Type", with: @participant_challenge_count.registration_type
    fill_in "Row Number", with: @participant_challenge_count.row_number
    click_on "Create Participant challenge count"

    assert_text "Participant challenge count was successfully created"
    click_on "Back"
  end

  test "updating a Participant challenge count" do
    visit participant_challenge_counts_url
    click_on "Edit", match: :first

    fill_in "Challenge", with: @participant_challenge_count.challenge_id
    fill_in "Participant", with: @participant_challenge_count.participant_id
    fill_in "Registration Type", with: @participant_challenge_count.registration_type
    fill_in "Row Number", with: @participant_challenge_count.row_number
    click_on "Update Participant challenge count"

    assert_text "Participant challenge count was successfully updated"
    click_on "Back"
  end

  test "destroying a Participant challenge count" do
    visit participant_challenge_counts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Participant challenge count was successfully destroyed"
  end
end
