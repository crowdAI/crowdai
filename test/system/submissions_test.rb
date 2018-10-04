require "application_system_test_case"

class SubmissionsTest < ApplicationSystemTestCase
  setup do
    @submission = submissions(:one)
  end

  test "visiting the index" do
    visit submissions_url
    assert_selector "h1", text: "Submissions"
  end

  test "creating a Submission" do
    visit submissions_url
    click_on "New Submission"

    fill_in "Api", with: @submission.api
    fill_in "Baseline", with: @submission.baseline
    fill_in "Baseline Comment", with: @submission.baseline_comment
    fill_in "Challenge", with: @submission.challenge_id
    fill_in "Challenge Round", with: @submission.challenge_round_id
    fill_in "Clef Additional", with: @submission.clef_additional
    fill_in "Clef Method Description", with: @submission.clef_method_description
    fill_in "Clef Other Info", with: @submission.clef_other_info
    fill_in "Clef Primary Run", with: @submission.clef_primary_run
    fill_in "Clef Retrieval Type", with: @submission.clef_retrieval_type
    fill_in "Clef Run Type", with: @submission.clef_run_type
    fill_in "Description", with: @submission.description
    fill_in "Description Markdown", with: @submission.description_markdown
    fill_in "Grading Message", with: @submission.grading_message
    fill_in "Grading Status Cd", with: @submission.grading_status_cd
    fill_in "Media Content Type", with: @submission.media_content_type
    fill_in "Media Large", with: @submission.media_large
    fill_in "Media Thumbnail", with: @submission.media_thumbnail
    fill_in "Meta", with: @submission.meta
    fill_in "Online Submission", with: @submission.online_submission
    fill_in "Participant", with: @submission.participant_id
    fill_in "Post Challenge", with: @submission.post_challenge
    fill_in "Score", with: @submission.score
    fill_in "Score Display", with: @submission.score_display
    fill_in "Score Secondary", with: @submission.score_secondary
    fill_in "Score Secondary Display", with: @submission.score_secondary_display
    fill_in "Short Url", with: @submission.short_url
    fill_in "Vote Count", with: @submission.vote_count
    click_on "Create Submission"

    assert_text "Submission was successfully created"
    click_on "Back"
  end

  test "updating a Submission" do
    visit submissions_url
    click_on "Edit", match: :first

    fill_in "Api", with: @submission.api
    fill_in "Baseline", with: @submission.baseline
    fill_in "Baseline Comment", with: @submission.baseline_comment
    fill_in "Challenge", with: @submission.challenge_id
    fill_in "Challenge Round", with: @submission.challenge_round_id
    fill_in "Clef Additional", with: @submission.clef_additional
    fill_in "Clef Method Description", with: @submission.clef_method_description
    fill_in "Clef Other Info", with: @submission.clef_other_info
    fill_in "Clef Primary Run", with: @submission.clef_primary_run
    fill_in "Clef Retrieval Type", with: @submission.clef_retrieval_type
    fill_in "Clef Run Type", with: @submission.clef_run_type
    fill_in "Description", with: @submission.description
    fill_in "Description Markdown", with: @submission.description_markdown
    fill_in "Grading Message", with: @submission.grading_message
    fill_in "Grading Status Cd", with: @submission.grading_status_cd
    fill_in "Media Content Type", with: @submission.media_content_type
    fill_in "Media Large", with: @submission.media_large
    fill_in "Media Thumbnail", with: @submission.media_thumbnail
    fill_in "Meta", with: @submission.meta
    fill_in "Online Submission", with: @submission.online_submission
    fill_in "Participant", with: @submission.participant_id
    fill_in "Post Challenge", with: @submission.post_challenge
    fill_in "Score", with: @submission.score
    fill_in "Score Display", with: @submission.score_display
    fill_in "Score Secondary", with: @submission.score_secondary
    fill_in "Score Secondary Display", with: @submission.score_secondary_display
    fill_in "Short Url", with: @submission.short_url
    fill_in "Vote Count", with: @submission.vote_count
    click_on "Update Submission"

    assert_text "Submission was successfully updated"
    click_on "Back"
  end

  test "destroying a Submission" do
    visit submissions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Submission was successfully destroyed"
  end
end
