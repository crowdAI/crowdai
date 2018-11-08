require "application_system_test_case"

class ChallengeRoundViewsTest < ApplicationSystemTestCase
  setup do
    @challenge_round_view = challenge_round_views(:one)
  end

  test "visiting the index" do
    visit challenge_round_views_url
    assert_selector "h1", text: "Challenge Round Views"
  end

  test "creating a Challenge round view" do
    visit challenge_round_views_url
    click_on "New Challenge Round View"

    fill_in "Active", with: @challenge_round_view.active
    fill_in "Challenge", with: @challenge_round_view.challenge_id
    fill_in "Challenge Round", with: @challenge_round_view.challenge_round
    fill_in "End Dttm", with: @challenge_round_view.end_dttm
    fill_in "Failed Submissions", with: @challenge_round_view.failed_submissions
    fill_in "Minimum Score", with: @challenge_round_view.minimum_score
    fill_in "Minimum Score Secondary", with: @challenge_round_view.minimum_score_secondary
    fill_in "Row Num", with: @challenge_round_view.row_num
    fill_in "Start Dttm", with: @challenge_round_view.start_dttm
    fill_in "Submission Limit", with: @challenge_round_view.submission_limit
    fill_in "Submission Limit Period Cd", with: @challenge_round_view.submission_limit_period_cd
    click_on "Create Challenge round view"

    assert_text "Challenge round view was successfully created"
    click_on "Back"
  end

  test "updating a Challenge round view" do
    visit challenge_round_views_url
    click_on "Edit", match: :first

    fill_in "Active", with: @challenge_round_view.active
    fill_in "Challenge", with: @challenge_round_view.challenge_id
    fill_in "Challenge Round", with: @challenge_round_view.challenge_round
    fill_in "End Dttm", with: @challenge_round_view.end_dttm
    fill_in "Failed Submissions", with: @challenge_round_view.failed_submissions
    fill_in "Minimum Score", with: @challenge_round_view.minimum_score
    fill_in "Minimum Score Secondary", with: @challenge_round_view.minimum_score_secondary
    fill_in "Row Num", with: @challenge_round_view.row_num
    fill_in "Start Dttm", with: @challenge_round_view.start_dttm
    fill_in "Submission Limit", with: @challenge_round_view.submission_limit
    fill_in "Submission Limit Period Cd", with: @challenge_round_view.submission_limit_period_cd
    click_on "Update Challenge round view"

    assert_text "Challenge round view was successfully updated"
    click_on "Back"
  end

  test "destroying a Challenge round view" do
    visit challenge_round_views_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Challenge round view was successfully destroyed"
  end
end
