require "application_system_test_case"

class ChallengeRoundSummariesTest < ApplicationSystemTestCase
  setup do
    @challenge_round_summary = challenge_round_summaries(:one)
  end

  test "visiting the index" do
    visit challenge_round_summaries_url
    assert_selector "h1", text: "Challenge Round Summaries"
  end

  test "creating a Challenge round summary" do
    visit challenge_round_summaries_url
    click_on "New Challenge Round Summary"

    fill_in "Active", with: @challenge_round_summary.active
    fill_in "Active Row Num", with: @challenge_round_summary.active_row_num
    fill_in "Challenge", with: @challenge_round_summary.challenge_id
    fill_in "Challenge Round", with: @challenge_round_summary.challenge_round
    fill_in "End Dttm", with: @challenge_round_summary.end_dttm
    fill_in "Failed Submissions", with: @challenge_round_summary.failed_submissions
    fill_in "Minimum Score", with: @challenge_round_summary.minimum_score
    fill_in "Minimum Score Secondary", with: @challenge_round_summary.minimum_score_secondary
    fill_in "Round Status Cd", with: @challenge_round_summary.round_status_cd
    fill_in "Row Num", with: @challenge_round_summary.row_num
    fill_in "Start Dttm", with: @challenge_round_summary.start_dttm
    fill_in "Status Cd", with: @challenge_round_summary.status_cd
    fill_in "Submission Limit", with: @challenge_round_summary.submission_limit
    fill_in "Submission Limit Period Cd", with: @challenge_round_summary.submission_limit_period_cd
    click_on "Create Challenge round summary"

    assert_text "Challenge round summary was successfully created"
    click_on "Back"
  end

  test "updating a Challenge round summary" do
    visit challenge_round_summaries_url
    click_on "Edit", match: :first

    fill_in "Active", with: @challenge_round_summary.active
    fill_in "Active Row Num", with: @challenge_round_summary.active_row_num
    fill_in "Challenge", with: @challenge_round_summary.challenge_id
    fill_in "Challenge Round", with: @challenge_round_summary.challenge_round
    fill_in "End Dttm", with: @challenge_round_summary.end_dttm
    fill_in "Failed Submissions", with: @challenge_round_summary.failed_submissions
    fill_in "Minimum Score", with: @challenge_round_summary.minimum_score
    fill_in "Minimum Score Secondary", with: @challenge_round_summary.minimum_score_secondary
    fill_in "Round Status Cd", with: @challenge_round_summary.round_status_cd
    fill_in "Row Num", with: @challenge_round_summary.row_num
    fill_in "Start Dttm", with: @challenge_round_summary.start_dttm
    fill_in "Status Cd", with: @challenge_round_summary.status_cd
    fill_in "Submission Limit", with: @challenge_round_summary.submission_limit
    fill_in "Submission Limit Period Cd", with: @challenge_round_summary.submission_limit_period_cd
    click_on "Update Challenge round summary"

    assert_text "Challenge round summary was successfully updated"
    click_on "Back"
  end

  test "destroying a Challenge round summary" do
    visit challenge_round_summaries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Challenge round summary was successfully destroyed"
  end
end
