require "application_system_test_case"

class LeaderboardSnapshotsTest < ApplicationSystemTestCase
  setup do
    @leaderboard_snapshot = leaderboard_snapshots(:one)
  end

  test "visiting the index" do
    visit leaderboard_snapshots_url
    assert_selector "h1", text: "Leaderboard Snapshots"
  end

  test "creating a Leaderboard snapshot" do
    visit leaderboard_snapshots_url
    click_on "New Leaderboard Snapshot"

    fill_in "Baseline", with: @leaderboard_snapshot.baseline
    fill_in "Baseline Comment", with: @leaderboard_snapshot.baseline_comment
    fill_in "Challenge", with: @leaderboard_snapshot.challenge_id
    fill_in "Challenge Round", with: @leaderboard_snapshot.challenge_round_id
    fill_in "Description", with: @leaderboard_snapshot.description
    fill_in "Description Markdown", with: @leaderboard_snapshot.description_markdown
    fill_in "Entries", with: @leaderboard_snapshot.entries
    fill_in "Leaderboard Type Cd", with: @leaderboard_snapshot.leaderboard_type_cd
    fill_in "Media Content Type", with: @leaderboard_snapshot.media_content_type
    fill_in "Media Large", with: @leaderboard_snapshot.media_large
    fill_in "Media Thumbnail", with: @leaderboard_snapshot.media_thumbnail
    fill_in "Name", with: @leaderboard_snapshot.name
    fill_in "Participant", with: @leaderboard_snapshot.participant_id
    fill_in "Post Challenge", with: @leaderboard_snapshot.post_challenge
    fill_in "Previous Row Num", with: @leaderboard_snapshot.previous_row_num
    fill_in "Refreshed At", with: @leaderboard_snapshot.refreshed_at
    fill_in "Row Num", with: @leaderboard_snapshot.row_num
    fill_in "Score", with: @leaderboard_snapshot.score
    fill_in "Score Secondary", with: @leaderboard_snapshot.score_secondary
    fill_in "Seq", with: @leaderboard_snapshot.seq
    fill_in "Slug", with: @leaderboard_snapshot.slug
    fill_in "Snapshot Instance", with: @leaderboard_snapshot.snapshot_instance
    fill_in "Submission", with: @leaderboard_snapshot.submission_id
    click_on "Create Leaderboard snapshot"

    assert_text "Leaderboard snapshot was successfully created"
    click_on "Back"
  end

  test "updating a Leaderboard snapshot" do
    visit leaderboard_snapshots_url
    click_on "Edit", match: :first

    fill_in "Baseline", with: @leaderboard_snapshot.baseline
    fill_in "Baseline Comment", with: @leaderboard_snapshot.baseline_comment
    fill_in "Challenge", with: @leaderboard_snapshot.challenge_id
    fill_in "Challenge Round", with: @leaderboard_snapshot.challenge_round_id
    fill_in "Description", with: @leaderboard_snapshot.description
    fill_in "Description Markdown", with: @leaderboard_snapshot.description_markdown
    fill_in "Entries", with: @leaderboard_snapshot.entries
    fill_in "Leaderboard Type Cd", with: @leaderboard_snapshot.leaderboard_type_cd
    fill_in "Media Content Type", with: @leaderboard_snapshot.media_content_type
    fill_in "Media Large", with: @leaderboard_snapshot.media_large
    fill_in "Media Thumbnail", with: @leaderboard_snapshot.media_thumbnail
    fill_in "Name", with: @leaderboard_snapshot.name
    fill_in "Participant", with: @leaderboard_snapshot.participant_id
    fill_in "Post Challenge", with: @leaderboard_snapshot.post_challenge
    fill_in "Previous Row Num", with: @leaderboard_snapshot.previous_row_num
    fill_in "Refreshed At", with: @leaderboard_snapshot.refreshed_at
    fill_in "Row Num", with: @leaderboard_snapshot.row_num
    fill_in "Score", with: @leaderboard_snapshot.score
    fill_in "Score Secondary", with: @leaderboard_snapshot.score_secondary
    fill_in "Seq", with: @leaderboard_snapshot.seq
    fill_in "Slug", with: @leaderboard_snapshot.slug
    fill_in "Snapshot Instance", with: @leaderboard_snapshot.snapshot_instance
    fill_in "Submission", with: @leaderboard_snapshot.submission_id
    click_on "Update Leaderboard snapshot"

    assert_text "Leaderboard snapshot was successfully updated"
    click_on "Back"
  end

  test "destroying a Leaderboard snapshot" do
    visit leaderboard_snapshots_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Leaderboard snapshot was successfully destroyed"
  end
end
