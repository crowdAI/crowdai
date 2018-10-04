require 'test_helper'

class OngoingLeaderboardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ongoing_leaderboard = ongoing_leaderboards(:one)
  end

  test "should get index" do
    get ongoing_leaderboards_url
    assert_response :success
  end

  test "should get new" do
    get new_ongoing_leaderboard_url
    assert_response :success
  end

  test "should create ongoing_leaderboard" do
    assert_difference('OngoingLeaderboard.count') do
      post ongoing_leaderboards_url, params: { ongoing_leaderboard: { baseline: @ongoing_leaderboard.baseline, baseline_comment: @ongoing_leaderboard.baseline_comment, challenge_id: @ongoing_leaderboard.challenge_id, challenge_round_id: @ongoing_leaderboard.challenge_round_id, description: @ongoing_leaderboard.description, description_markdown: @ongoing_leaderboard.description_markdown, entries: @ongoing_leaderboard.entries, leaderboard_type_cd: @ongoing_leaderboard.leaderboard_type_cd, media_content_type: @ongoing_leaderboard.media_content_type, media_large: @ongoing_leaderboard.media_large, media_thumbnail: @ongoing_leaderboard.media_thumbnail, name: @ongoing_leaderboard.name, participant_id: @ongoing_leaderboard.participant_id, post_challenge: @ongoing_leaderboard.post_challenge, previous_row_num: @ongoing_leaderboard.previous_row_num, refreshed_at: @ongoing_leaderboard.refreshed_at, row_num: @ongoing_leaderboard.row_num, score: @ongoing_leaderboard.score, score_secondary: @ongoing_leaderboard.score_secondary, seq: @ongoing_leaderboard.seq, slug: @ongoing_leaderboard.slug, submission_id: @ongoing_leaderboard.submission_id } }
    end

    assert_redirected_to ongoing_leaderboard_url(OngoingLeaderboard.last)
  end

  test "should show ongoing_leaderboard" do
    get ongoing_leaderboard_url(@ongoing_leaderboard)
    assert_response :success
  end

  test "should get edit" do
    get edit_ongoing_leaderboard_url(@ongoing_leaderboard)
    assert_response :success
  end

  test "should update ongoing_leaderboard" do
    patch ongoing_leaderboard_url(@ongoing_leaderboard), params: { ongoing_leaderboard: { baseline: @ongoing_leaderboard.baseline, baseline_comment: @ongoing_leaderboard.baseline_comment, challenge_id: @ongoing_leaderboard.challenge_id, challenge_round_id: @ongoing_leaderboard.challenge_round_id, description: @ongoing_leaderboard.description, description_markdown: @ongoing_leaderboard.description_markdown, entries: @ongoing_leaderboard.entries, leaderboard_type_cd: @ongoing_leaderboard.leaderboard_type_cd, media_content_type: @ongoing_leaderboard.media_content_type, media_large: @ongoing_leaderboard.media_large, media_thumbnail: @ongoing_leaderboard.media_thumbnail, name: @ongoing_leaderboard.name, participant_id: @ongoing_leaderboard.participant_id, post_challenge: @ongoing_leaderboard.post_challenge, previous_row_num: @ongoing_leaderboard.previous_row_num, refreshed_at: @ongoing_leaderboard.refreshed_at, row_num: @ongoing_leaderboard.row_num, score: @ongoing_leaderboard.score, score_secondary: @ongoing_leaderboard.score_secondary, seq: @ongoing_leaderboard.seq, slug: @ongoing_leaderboard.slug, submission_id: @ongoing_leaderboard.submission_id } }
    assert_redirected_to ongoing_leaderboard_url(@ongoing_leaderboard)
  end

  test "should destroy ongoing_leaderboard" do
    assert_difference('OngoingLeaderboard.count', -1) do
      delete ongoing_leaderboard_url(@ongoing_leaderboard)
    end

    assert_redirected_to ongoing_leaderboards_url
  end
end
