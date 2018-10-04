require "application_system_test_case"

class ParticipantSubmissionsTest < ApplicationSystemTestCase
  setup do
    @participant_submission = participant_submissions(:one)
  end

  test "visiting the index" do
    visit participant_submissions_url
    assert_selector "h1", text: "Participant Submissions"
  end

  test "creating a Participant submission" do
    visit participant_submissions_url
    click_on "New Participant Submission"

    fill_in "Challenge", with: @participant_submission.challenge_id
    fill_in "Files", with: @participant_submission.files
    fill_in "Grading Status Cd", with: @participant_submission.grading_status_cd
    fill_in "Name", with: @participant_submission.name
    fill_in "Participant", with: @participant_submission.participant_id
    fill_in "Post Challenge", with: @participant_submission.post_challenge
    fill_in "Score", with: @participant_submission.score
    fill_in "Score Secondary", with: @participant_submission.score_secondary
    click_on "Create Participant submission"

    assert_text "Participant submission was successfully created"
    click_on "Back"
  end

  test "updating a Participant submission" do
    visit participant_submissions_url
    click_on "Edit", match: :first

    fill_in "Challenge", with: @participant_submission.challenge_id
    fill_in "Files", with: @participant_submission.files
    fill_in "Grading Status Cd", with: @participant_submission.grading_status_cd
    fill_in "Name", with: @participant_submission.name
    fill_in "Participant", with: @participant_submission.participant_id
    fill_in "Post Challenge", with: @participant_submission.post_challenge
    fill_in "Score", with: @participant_submission.score
    fill_in "Score Secondary", with: @participant_submission.score_secondary
    click_on "Update Participant submission"

    assert_text "Participant submission was successfully updated"
    click_on "Back"
  end

  test "destroying a Participant submission" do
    visit participant_submissions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Participant submission was successfully destroyed"
  end
end
