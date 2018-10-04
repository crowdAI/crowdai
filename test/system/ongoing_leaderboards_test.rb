require "application_system_test_case"

class OngoingLeaderboardsTest < ApplicationSystemTestCase
  setup do
    @ongoing_leaderboard = ongoing_leaderboards(:one)
  end

  test "visiting the index" do
    visit ongoing_leaderboards_url
    assert_selector "h1", text: "Ongoing Leaderboards"
  end

  test "creating a Ongoing leaderboard" do
    visit ongoing_leaderboards_url
    click_on "New Ongoing Leaderboard"

    fill_in "Baseline", with: @ongoing_leaderboard.baseline
    fill_in "Baseline Comment", with: @ongoing_leaderboard.baseline_comment
    fill_in "Challenge", with: @ongoing_leaderboard.challenge_id
    fill_in "Challenge Round", with: @ongoing_leaderboard.challenge_round_id
    fill_in "Description", with: @ongoing_leaderboard.description
    fill_in "Description Markdown", with: @ongoing_leaderboard.description_markdown
    fill_in "Entries", with: @ongoing_leaderboard.entries
    fill_in "Leaderboard Type Cd", with: @ongoing_leaderboard.leaderboard_type_cd
    fill_in "Media Content Type", with: @ongoing_leaderboard.media_content_type
    fill_in "Media Large", with: @ongoing_leaderboard.media_large
    fill_in "Media Thumbnail", with: @ongoing_leaderboard.media_thumbnail
    fill_in "Name", with: @ongoing_leaderboard.name
    fill_in "Participant", with: @ongoing_leaderboard.participant_id
    fill_in "Post Challenge", with: @ongoing_leaderboard.post_challenge
    fill_in "Previous Row Num", with: @ongoing_leaderboard.previous_row_num
    fill_in "Refreshed At", with: @ongoing_leaderboard.refreshed_at
    fill_in "Row Num", with: @ongoing_leaderboard.row_num
    fill_in "Score", with: @ongoing_leaderboard.score
    fill_in "Score Secondary", with: @ongoing_leaderboard.score_secondary
    fill_in "Seq", with: @ongoing_leaderboard.seq
    fill_in "Slug", with: @ongoing_leaderboard.slug
    fill_in "Submission", with: @ongoing_leaderboard.submission_id
    click_on "Create Ongoing leaderboard"

    assert_text "Ongoing leaderboard was successfully created"
    click_on "Back"
  end

  test "updating a Ongoing leaderboard" do
    visit ongoing_leaderboards_url
    click_on "Edit", match: :first

    fill_in "Baseline", with: @ongoing_leaderboard.baseline
    fill_in "Baseline Comment", with: @ongoing_leaderboard.baseline_comment
    fill_in "Challenge", with: @ongoing_leaderboard.challenge_id
    fill_in "Challenge Round", with: @ongoing_leaderboard.challenge_round_id
    fill_in "Description", with: @ongoing_leaderboard.description
    fill_in "Description Markdown", with: @ongoing_leaderboard.description_markdown
    fill_in "Entries", with: @ongoing_leaderboard.entries
    fill_in "Leaderboard Type Cd", with: @ongoing_leaderboard.leaderboard_type_cd
    fill_in "Media Content Type", with: @ongoing_leaderboard.media_content_type
    fill_in "Media Large", with: @ongoing_leaderboard.media_large
    fill_in "Media Thumbnail", with: @ongoing_leaderboard.media_thumbnail
    fill_in "Name", with: @ongoing_leaderboard.name
    fill_in "Participant", with: @ongoing_leaderboard.participant_id
    fill_in "Post Challenge", with: @ongoing_leaderboard.post_challenge
    fill_in "Previous Row Num", with: @ongoing_leaderboard.previous_row_num
    fill_in "Refreshed At", with: @ongoing_leaderboard.refreshed_at
    fill_in "Row Num", with: @ongoing_leaderboard.row_num
    fill_in "Score", with: @ongoing_leaderboard.score
    fill_in "Score Secondary", with: @ongoing_leaderboard.score_secondary
    fill_in "Seq", with: @ongoing_leaderboard.seq
    fill_in "Slug", with: @ongoing_leaderboard.slug
    fill_in "Submission", with: @ongoing_leaderboard.submission_id
    click_on "Update Ongoing leaderboard"

    assert_text "Ongoing leaderboard was successfully updated"
    click_on "Back"
  end

  test "destroying a Ongoing leaderboard" do
    visit ongoing_leaderboards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ongoing leaderboard was successfully destroyed"
  end
end
