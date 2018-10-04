require "application_system_test_case"

class LeaderboardsTest < ApplicationSystemTestCase
  setup do
    @leaderboard = leaderboards(:one)
  end

  test "visiting the index" do
    visit leaderboards_url
    assert_selector "h1", text: "Leaderboards"
  end

  test "creating a Leaderboard" do
    visit leaderboards_url
    click_on "New Leaderboard"

    fill_in "Baseline", with: @leaderboard.baseline
    fill_in "Baseline Comment", with: @leaderboard.baseline_comment
    fill_in "Challenge", with: @leaderboard.challenge_id
    fill_in "Challenge Round", with: @leaderboard.challenge_round_id
    fill_in "Description", with: @leaderboard.description
    fill_in "Description Markdown", with: @leaderboard.description_markdown
    fill_in "Entries", with: @leaderboard.entries
    fill_in "Leaderboard Type Cd", with: @leaderboard.leaderboard_type_cd
    fill_in "Media Content Type", with: @leaderboard.media_content_type
    fill_in "Media Large", with: @leaderboard.media_large
    fill_in "Media Thumbnail", with: @leaderboard.media_thumbnail
    fill_in "Name", with: @leaderboard.name
    fill_in "Participant", with: @leaderboard.participant_id
    fill_in "Post Challenge", with: @leaderboard.post_challenge
    fill_in "Previous Row Num", with: @leaderboard.previous_row_num
    fill_in "Refreshed At", with: @leaderboard.refreshed_at
    fill_in "Row Num", with: @leaderboard.row_num
    fill_in "Score", with: @leaderboard.score
    fill_in "Score Secondary", with: @leaderboard.score_secondary
    fill_in "Seq", with: @leaderboard.seq
    fill_in "Slug", with: @leaderboard.slug
    fill_in "Submission", with: @leaderboard.submission_id
    click_on "Create Leaderboard"

    assert_text "Leaderboard was successfully created"
    click_on "Back"
  end

  test "updating a Leaderboard" do
    visit leaderboards_url
    click_on "Edit", match: :first

    fill_in "Baseline", with: @leaderboard.baseline
    fill_in "Baseline Comment", with: @leaderboard.baseline_comment
    fill_in "Challenge", with: @leaderboard.challenge_id
    fill_in "Challenge Round", with: @leaderboard.challenge_round_id
    fill_in "Description", with: @leaderboard.description
    fill_in "Description Markdown", with: @leaderboard.description_markdown
    fill_in "Entries", with: @leaderboard.entries
    fill_in "Leaderboard Type Cd", with: @leaderboard.leaderboard_type_cd
    fill_in "Media Content Type", with: @leaderboard.media_content_type
    fill_in "Media Large", with: @leaderboard.media_large
    fill_in "Media Thumbnail", with: @leaderboard.media_thumbnail
    fill_in "Name", with: @leaderboard.name
    fill_in "Participant", with: @leaderboard.participant_id
    fill_in "Post Challenge", with: @leaderboard.post_challenge
    fill_in "Previous Row Num", with: @leaderboard.previous_row_num
    fill_in "Refreshed At", with: @leaderboard.refreshed_at
    fill_in "Row Num", with: @leaderboard.row_num
    fill_in "Score", with: @leaderboard.score
    fill_in "Score Secondary", with: @leaderboard.score_secondary
    fill_in "Seq", with: @leaderboard.seq
    fill_in "Slug", with: @leaderboard.slug
    fill_in "Submission", with: @leaderboard.submission_id
    click_on "Update Leaderboard"

    assert_text "Leaderboard was successfully updated"
    click_on "Back"
  end

  test "destroying a Leaderboard" do
    visit leaderboards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Leaderboard was successfully destroyed"
  end
end
