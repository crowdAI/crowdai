require "application_system_test_case"

class PreviousLeaderboardsTest < ApplicationSystemTestCase
  setup do
    @previous_leaderboard = previous_leaderboards(:one)
  end

  test "visiting the index" do
    visit previous_leaderboards_url
    assert_selector "h1", text: "Previous Leaderboards"
  end

  test "creating a Previous leaderboard" do
    visit previous_leaderboards_url
    click_on "New Previous Leaderboard"

    fill_in "Baseline", with: @previous_leaderboard.baseline
    fill_in "Baseline Comment", with: @previous_leaderboard.baseline_comment
    fill_in "Challenge", with: @previous_leaderboard.challenge_id
    fill_in "Challenge Round", with: @previous_leaderboard.challenge_round_id
    fill_in "Description", with: @previous_leaderboard.description
    fill_in "Description Markdown", with: @previous_leaderboard.description_markdown
    fill_in "Entries", with: @previous_leaderboard.entries
    fill_in "Leaderboard Type Cd", with: @previous_leaderboard.leaderboard_type_cd
    fill_in "Media Content Type", with: @previous_leaderboard.media_content_type
    fill_in "Media Large", with: @previous_leaderboard.media_large
    fill_in "Media Thumbnail", with: @previous_leaderboard.media_thumbnail
    fill_in "Name", with: @previous_leaderboard.name
    fill_in "Participant", with: @previous_leaderboard.participant_id
    fill_in "Post Challenge", with: @previous_leaderboard.post_challenge
    fill_in "Previous Row Num", with: @previous_leaderboard.previous_row_num
    fill_in "Refreshed At", with: @previous_leaderboard.refreshed_at
    fill_in "Row Num", with: @previous_leaderboard.row_num
    fill_in "Score", with: @previous_leaderboard.score
    fill_in "Score Secondary", with: @previous_leaderboard.score_secondary
    fill_in "Seq", with: @previous_leaderboard.seq
    fill_in "Slug", with: @previous_leaderboard.slug
    fill_in "Submission", with: @previous_leaderboard.submission_id
    click_on "Create Previous leaderboard"

    assert_text "Previous leaderboard was successfully created"
    click_on "Back"
  end

  test "updating a Previous leaderboard" do
    visit previous_leaderboards_url
    click_on "Edit", match: :first

    fill_in "Baseline", with: @previous_leaderboard.baseline
    fill_in "Baseline Comment", with: @previous_leaderboard.baseline_comment
    fill_in "Challenge", with: @previous_leaderboard.challenge_id
    fill_in "Challenge Round", with: @previous_leaderboard.challenge_round_id
    fill_in "Description", with: @previous_leaderboard.description
    fill_in "Description Markdown", with: @previous_leaderboard.description_markdown
    fill_in "Entries", with: @previous_leaderboard.entries
    fill_in "Leaderboard Type Cd", with: @previous_leaderboard.leaderboard_type_cd
    fill_in "Media Content Type", with: @previous_leaderboard.media_content_type
    fill_in "Media Large", with: @previous_leaderboard.media_large
    fill_in "Media Thumbnail", with: @previous_leaderboard.media_thumbnail
    fill_in "Name", with: @previous_leaderboard.name
    fill_in "Participant", with: @previous_leaderboard.participant_id
    fill_in "Post Challenge", with: @previous_leaderboard.post_challenge
    fill_in "Previous Row Num", with: @previous_leaderboard.previous_row_num
    fill_in "Refreshed At", with: @previous_leaderboard.refreshed_at
    fill_in "Row Num", with: @previous_leaderboard.row_num
    fill_in "Score", with: @previous_leaderboard.score
    fill_in "Score Secondary", with: @previous_leaderboard.score_secondary
    fill_in "Seq", with: @previous_leaderboard.seq
    fill_in "Slug", with: @previous_leaderboard.slug
    fill_in "Submission", with: @previous_leaderboard.submission_id
    click_on "Update Previous leaderboard"

    assert_text "Previous leaderboard was successfully updated"
    click_on "Back"
  end

  test "destroying a Previous leaderboard" do
    visit previous_leaderboards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Previous leaderboard was successfully destroyed"
  end
end
