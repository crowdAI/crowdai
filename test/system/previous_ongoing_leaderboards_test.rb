require "application_system_test_case"

class PreviousOngoingLeaderboardsTest < ApplicationSystemTestCase
  setup do
    @previous_ongoing_leaderboard = previous_ongoing_leaderboards(:one)
  end

  test "visiting the index" do
    visit previous_ongoing_leaderboards_url
    assert_selector "h1", text: "Previous Ongoing Leaderboards"
  end

  test "creating a Previous ongoing leaderboard" do
    visit previous_ongoing_leaderboards_url
    click_on "New Previous Ongoing Leaderboard"

    fill_in "Baseline", with: @previous_ongoing_leaderboard.baseline
    fill_in "Baseline Comment", with: @previous_ongoing_leaderboard.baseline_comment
    fill_in "Challenge", with: @previous_ongoing_leaderboard.challenge_id
    fill_in "Challenge Round", with: @previous_ongoing_leaderboard.challenge_round_id
    fill_in "Description", with: @previous_ongoing_leaderboard.description
    fill_in "Description Markdown", with: @previous_ongoing_leaderboard.description_markdown
    fill_in "Entries", with: @previous_ongoing_leaderboard.entries
    fill_in "Leaderboard Type Cd", with: @previous_ongoing_leaderboard.leaderboard_type_cd
    fill_in "Media Content Type", with: @previous_ongoing_leaderboard.media_content_type
    fill_in "Media Large", with: @previous_ongoing_leaderboard.media_large
    fill_in "Media Thumbnail", with: @previous_ongoing_leaderboard.media_thumbnail
    fill_in "Name", with: @previous_ongoing_leaderboard.name
    fill_in "Participant", with: @previous_ongoing_leaderboard.participant_id
    fill_in "Post Challenge", with: @previous_ongoing_leaderboard.post_challenge
    fill_in "Previous Row Num", with: @previous_ongoing_leaderboard.previous_row_num
    fill_in "Refreshed At", with: @previous_ongoing_leaderboard.refreshed_at
    fill_in "Row Num", with: @previous_ongoing_leaderboard.row_num
    fill_in "Score", with: @previous_ongoing_leaderboard.score
    fill_in "Score Secondary", with: @previous_ongoing_leaderboard.score_secondary
    fill_in "Seq", with: @previous_ongoing_leaderboard.seq
    fill_in "Slug", with: @previous_ongoing_leaderboard.slug
    fill_in "Submission", with: @previous_ongoing_leaderboard.submission_id
    click_on "Create Previous ongoing leaderboard"

    assert_text "Previous ongoing leaderboard was successfully created"
    click_on "Back"
  end

  test "updating a Previous ongoing leaderboard" do
    visit previous_ongoing_leaderboards_url
    click_on "Edit", match: :first

    fill_in "Baseline", with: @previous_ongoing_leaderboard.baseline
    fill_in "Baseline Comment", with: @previous_ongoing_leaderboard.baseline_comment
    fill_in "Challenge", with: @previous_ongoing_leaderboard.challenge_id
    fill_in "Challenge Round", with: @previous_ongoing_leaderboard.challenge_round_id
    fill_in "Description", with: @previous_ongoing_leaderboard.description
    fill_in "Description Markdown", with: @previous_ongoing_leaderboard.description_markdown
    fill_in "Entries", with: @previous_ongoing_leaderboard.entries
    fill_in "Leaderboard Type Cd", with: @previous_ongoing_leaderboard.leaderboard_type_cd
    fill_in "Media Content Type", with: @previous_ongoing_leaderboard.media_content_type
    fill_in "Media Large", with: @previous_ongoing_leaderboard.media_large
    fill_in "Media Thumbnail", with: @previous_ongoing_leaderboard.media_thumbnail
    fill_in "Name", with: @previous_ongoing_leaderboard.name
    fill_in "Participant", with: @previous_ongoing_leaderboard.participant_id
    fill_in "Post Challenge", with: @previous_ongoing_leaderboard.post_challenge
    fill_in "Previous Row Num", with: @previous_ongoing_leaderboard.previous_row_num
    fill_in "Refreshed At", with: @previous_ongoing_leaderboard.refreshed_at
    fill_in "Row Num", with: @previous_ongoing_leaderboard.row_num
    fill_in "Score", with: @previous_ongoing_leaderboard.score
    fill_in "Score Secondary", with: @previous_ongoing_leaderboard.score_secondary
    fill_in "Seq", with: @previous_ongoing_leaderboard.seq
    fill_in "Slug", with: @previous_ongoing_leaderboard.slug
    fill_in "Submission", with: @previous_ongoing_leaderboard.submission_id
    click_on "Update Previous ongoing leaderboard"

    assert_text "Previous ongoing leaderboard was successfully updated"
    click_on "Back"
  end

  test "destroying a Previous ongoing leaderboard" do
    visit previous_ongoing_leaderboards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Previous ongoing leaderboard was successfully destroyed"
  end
end
