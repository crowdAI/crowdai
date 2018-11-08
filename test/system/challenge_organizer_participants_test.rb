require "application_system_test_case"

class ChallengeOrganizerParticipantsTest < ApplicationSystemTestCase
  setup do
    @challenge_organizer_participant = challenge_organizer_participants(:one)
  end

  test "visiting the index" do
    visit challenge_organizer_participants_url
    assert_selector "h1", text: "Challenge Organizer Participants"
  end

  test "creating a Challenge organizer participant" do
    visit challenge_organizer_participants_url
    click_on "New Challenge Organizer Participant"

    fill_in "Challenge", with: @challenge_organizer_participant.challenge
    fill_in "Clef Task", with: @challenge_organizer_participant.clef_task_id
    fill_in "Name", with: @challenge_organizer_participant.name
    fill_in "Organizer", with: @challenge_organizer_participant.organizer_id
    fill_in "Participant", with: @challenge_organizer_participant.participant_id
    click_on "Create Challenge organizer participant"

    assert_text "Challenge organizer participant was successfully created"
    click_on "Back"
  end

  test "updating a Challenge organizer participant" do
    visit challenge_organizer_participants_url
    click_on "Edit", match: :first

    fill_in "Challenge", with: @challenge_organizer_participant.challenge
    fill_in "Clef Task", with: @challenge_organizer_participant.clef_task_id
    fill_in "Name", with: @challenge_organizer_participant.name
    fill_in "Organizer", with: @challenge_organizer_participant.organizer_id
    fill_in "Participant", with: @challenge_organizer_participant.participant_id
    click_on "Update Challenge organizer participant"

    assert_text "Challenge organizer participant was successfully updated"
    click_on "Back"
  end

  test "destroying a Challenge organizer participant" do
    visit challenge_organizer_participants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Challenge organizer participant was successfully destroyed"
  end
end
