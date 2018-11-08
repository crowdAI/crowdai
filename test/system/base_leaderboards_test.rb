require "application_system_test_case"

class BaseLeaderboardsTest < ApplicationSystemTestCase
  setup do
    @base_leaderboard = base_leaderboards(:one)
  end

  test "visiting the index" do
    visit base_leaderboards_url
    assert_selector "h1", text: "Base Leaderboards"
  end

  test "creating a Base leaderboard" do
    visit base_leaderboards_url
    click_on "New Base Leaderboard"

    fill_in "Baseline", with: @base_leaderboard.baseline
    fill_in "Baseline Comment", with: @base_leaderboard.baseline_comment
    fill_in "Challenge", with: @base_leaderboard.challenge_id
    fill_in "Challenge Round", with: @base_leaderboard.challenge_round_id
    fill_in "Description", with: @base_leaderboard.description
    fill_in "Description Markdown", with: @base_leaderboard.description_markdown
    fill_in "Entries", with: @base_leaderboard.entries
    fill_in "Leaderboard Type Cd", with: @base_leaderboard.leaderboard_type_cd
    fill_in "Media Content Type", with: @base_leaderboard.media_content_type
    fill_in "Media Large", with: @base_leaderboard.media_large
    fill_in "Media Thumbnail", with: @base_leaderboard.media_thumbnail
    fill_in "Name", with: @base_leaderboard.name
    fill_in "Participant", with: @base_leaderboard.participant_id
    fill_in "Post Challenge", with: @base_leaderboard.post_challenge
    fill_in "Previous Row Num", with: @base_leaderboard.previous_row_num
    fill_in "Refreshed At", with: @base_leaderboard.refreshed_at
    fill_in "Row Num", with: @base_leaderboard.row_num
    fill_in "Score", with: @base_leaderboard.score
    fill_in "Score Secondary", with: @base_leaderboard.score_secondary
    fill_in "Seq", with: @base_leaderboard.seq
    fill_in "Slug", with: @base_leaderboard.slug
    fill_in "Submission", with: @base_leaderboard.submission_id
    click_on "Create Base leaderboard"

    assert_text "Base leaderboard was successfully created"
    click_on "Back"
  end

  test "updating a Base leaderboard" do
    visit base_leaderboards_url
    click_on "Edit", match: :first

    fill_in "Baseline", with: @base_leaderboard.baseline
    fill_in "Baseline Comment", with: @base_leaderboard.baseline_comment
    fill_in "Challenge", with: @base_leaderboard.challenge_id
    fill_in "Challenge Round", with: @base_leaderboard.challenge_round_id
    fill_in "Description", with: @base_leaderboard.description
    fill_in "Description Markdown", with: @base_leaderboard.description_markdown
    fill_in "Entries", with: @base_leaderboard.entries
    fill_in "Leaderboard Type Cd", with: @base_leaderboard.leaderboard_type_cd
    fill_in "Media Content Type", with: @base_leaderboard.media_content_type
    fill_in "Media Large", with: @base_leaderboard.media_large
    fill_in "Media Thumbnail", with: @base_leaderboard.media_thumbnail
    fill_in "Name", with: @base_leaderboard.name
    fill_in "Participant", with: @base_leaderboard.participant_id
    fill_in "Post Challenge", with: @base_leaderboard.post_challenge
    fill_in "Previous Row Num", with: @base_leaderboard.previous_row_num
    fill_in "Refreshed At", with: @base_leaderboard.refreshed_at
    fill_in "Row Num", with: @base_leaderboard.row_num
    fill_in "Score", with: @base_leaderboard.score
    fill_in "Score Secondary", with: @base_leaderboard.score_secondary
    fill_in "Seq", with: @base_leaderboard.seq
    fill_in "Slug", with: @base_leaderboard.slug
    fill_in "Submission", with: @base_leaderboard.submission_id
    click_on "Update Base leaderboard"

    assert_text "Base leaderboard was successfully updated"
    click_on "Back"
  end

  test "destroying a Base leaderboard" do
    visit base_leaderboards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Base leaderboard was successfully destroyed"
  end
end
