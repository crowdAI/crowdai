require 'test_helper'

class LeaderboardSnapshotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @leaderboard_snapshot = leaderboard_snapshots(:one)
  end

  test "should get index" do
    get leaderboard_snapshots_url
    assert_response :success
  end

  test "should get new" do
    get new_leaderboard_snapshot_url
    assert_response :success
  end

  test "should create leaderboard_snapshot" do
    assert_difference('LeaderboardSnapshot.count') do
      post leaderboard_snapshots_url, params: { leaderboard_snapshot: { baseline: @leaderboard_snapshot.baseline, baseline_comment: @leaderboard_snapshot.baseline_comment, challenge_id: @leaderboard_snapshot.challenge_id, challenge_round_id: @leaderboard_snapshot.challenge_round_id, description: @leaderboard_snapshot.description, description_markdown: @leaderboard_snapshot.description_markdown, entries: @leaderboard_snapshot.entries, leaderboard_type_cd: @leaderboard_snapshot.leaderboard_type_cd, media_content_type: @leaderboard_snapshot.media_content_type, media_large: @leaderboard_snapshot.media_large, media_thumbnail: @leaderboard_snapshot.media_thumbnail, name: @leaderboard_snapshot.name, participant_id: @leaderboard_snapshot.participant_id, post_challenge: @leaderboard_snapshot.post_challenge, previous_row_num: @leaderboard_snapshot.previous_row_num, refreshed_at: @leaderboard_snapshot.refreshed_at, row_num: @leaderboard_snapshot.row_num, score: @leaderboard_snapshot.score, score_secondary: @leaderboard_snapshot.score_secondary, seq: @leaderboard_snapshot.seq, slug: @leaderboard_snapshot.slug, snapshot_instance: @leaderboard_snapshot.snapshot_instance, submission_id: @leaderboard_snapshot.submission_id } }
    end

    assert_redirected_to leaderboard_snapshot_url(LeaderboardSnapshot.last)
  end

  test "should show leaderboard_snapshot" do
    get leaderboard_snapshot_url(@leaderboard_snapshot)
    assert_response :success
  end

  test "should get edit" do
    get edit_leaderboard_snapshot_url(@leaderboard_snapshot)
    assert_response :success
  end

  test "should update leaderboard_snapshot" do
    patch leaderboard_snapshot_url(@leaderboard_snapshot), params: { leaderboard_snapshot: { baseline: @leaderboard_snapshot.baseline, baseline_comment: @leaderboard_snapshot.baseline_comment, challenge_id: @leaderboard_snapshot.challenge_id, challenge_round_id: @leaderboard_snapshot.challenge_round_id, description: @leaderboard_snapshot.description, description_markdown: @leaderboard_snapshot.description_markdown, entries: @leaderboard_snapshot.entries, leaderboard_type_cd: @leaderboard_snapshot.leaderboard_type_cd, media_content_type: @leaderboard_snapshot.media_content_type, media_large: @leaderboard_snapshot.media_large, media_thumbnail: @leaderboard_snapshot.media_thumbnail, name: @leaderboard_snapshot.name, participant_id: @leaderboard_snapshot.participant_id, post_challenge: @leaderboard_snapshot.post_challenge, previous_row_num: @leaderboard_snapshot.previous_row_num, refreshed_at: @leaderboard_snapshot.refreshed_at, row_num: @leaderboard_snapshot.row_num, score: @leaderboard_snapshot.score, score_secondary: @leaderboard_snapshot.score_secondary, seq: @leaderboard_snapshot.seq, slug: @leaderboard_snapshot.slug, snapshot_instance: @leaderboard_snapshot.snapshot_instance, submission_id: @leaderboard_snapshot.submission_id } }
    assert_redirected_to leaderboard_snapshot_url(@leaderboard_snapshot)
  end

  test "should destroy leaderboard_snapshot" do
    assert_difference('LeaderboardSnapshot.count', -1) do
      delete leaderboard_snapshot_url(@leaderboard_snapshot)
    end

    assert_redirected_to leaderboard_snapshots_url
  end
end
