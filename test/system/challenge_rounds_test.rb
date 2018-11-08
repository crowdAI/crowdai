require "application_system_test_case"

class ChallengeRoundsTest < ApplicationSystemTestCase
  setup do
    @challenge_round = challenge_rounds(:one)
  end

  test "visiting the index" do
    visit challenge_rounds_url
    assert_selector "h1", text: "Challenge Rounds"
  end

  test "creating a Challenge round" do
    visit challenge_rounds_url
    click_on "New Challenge Round"

    fill_in "Active", with: @challenge_round.active
    fill_in "Challenge", with: @challenge_round.challenge_id
    fill_in "Challenge Round", with: @challenge_round.challenge_round
    fill_in "End Dttm", with: @challenge_round.end_dttm
    fill_in "Failed Submissions", with: @challenge_round.failed_submissions
    fill_in "Leaderboard Note", with: @challenge_round.leaderboard_note
    fill_in "Leaderboard Note Markdown", with: @challenge_round.leaderboard_note_markdown
    fill_in "Minimum Score", with: @challenge_round.minimum_score
    fill_in "Minimum Score Secondary", with: @challenge_round.minimum_score_secondary
    fill_in "Ranking Highlight", with: @challenge_round.ranking_highlight
    fill_in "Ranking Window", with: @challenge_round.ranking_window
    fill_in "Score Precision", with: @challenge_round.score_precision
    fill_in "Score Secondary Precision", with: @challenge_round.score_secondary_precision
    fill_in "Start Dttm", with: @challenge_round.start_dttm
    fill_in "Submission Limit", with: @challenge_round.submission_limit
    fill_in "Submission Limit Period Cd", with: @challenge_round.submission_limit_period_cd
    click_on "Create Challenge round"

    assert_text "Challenge round was successfully created"
    click_on "Back"
  end

  test "updating a Challenge round" do
    visit challenge_rounds_url
    click_on "Edit", match: :first

    fill_in "Active", with: @challenge_round.active
    fill_in "Challenge", with: @challenge_round.challenge_id
    fill_in "Challenge Round", with: @challenge_round.challenge_round
    fill_in "End Dttm", with: @challenge_round.end_dttm
    fill_in "Failed Submissions", with: @challenge_round.failed_submissions
    fill_in "Leaderboard Note", with: @challenge_round.leaderboard_note
    fill_in "Leaderboard Note Markdown", with: @challenge_round.leaderboard_note_markdown
    fill_in "Minimum Score", with: @challenge_round.minimum_score
    fill_in "Minimum Score Secondary", with: @challenge_round.minimum_score_secondary
    fill_in "Ranking Highlight", with: @challenge_round.ranking_highlight
    fill_in "Ranking Window", with: @challenge_round.ranking_window
    fill_in "Score Precision", with: @challenge_round.score_precision
    fill_in "Score Secondary Precision", with: @challenge_round.score_secondary_precision
    fill_in "Start Dttm", with: @challenge_round.start_dttm
    fill_in "Submission Limit", with: @challenge_round.submission_limit
    fill_in "Submission Limit Period Cd", with: @challenge_round.submission_limit_period_cd
    click_on "Update Challenge round"

    assert_text "Challenge round was successfully updated"
    click_on "Back"
  end

  test "destroying a Challenge round" do
    visit challenge_rounds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Challenge round was successfully destroyed"
  end
end
