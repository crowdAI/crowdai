require 'test_helper'

class PreviousOngoingLeaderboardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @previous_ongoing_leaderboard = previous_ongoing_leaderboards(:one)
  end

  test "should get index" do
    get previous_ongoing_leaderboards_url
    assert_response :success
  end

  test "should get new" do
    get new_previous_ongoing_leaderboard_url
    assert_response :success
  end

  test "should create previous_ongoing_leaderboard" do
    assert_difference('PreviousOngoingLeaderboard.count') do
      post previous_ongoing_leaderboards_url, params: { previous_ongoing_leaderboard: { baseline: @previous_ongoing_leaderboard.baseline, baseline_comment: @previous_ongoing_leaderboard.baseline_comment, challenge_id: @previous_ongoing_leaderboard.challenge_id, challenge_round_id: @previous_ongoing_leaderboard.challenge_round_id, description: @previous_ongoing_leaderboard.description, description_markdown: @previous_ongoing_leaderboard.description_markdown, entries: @previous_ongoing_leaderboard.entries, leaderboard_type_cd: @previous_ongoing_leaderboard.leaderboard_type_cd, media_content_type: @previous_ongoing_leaderboard.media_content_type, media_large: @previous_ongoing_leaderboard.media_large, media_thumbnail: @previous_ongoing_leaderboard.media_thumbnail, name: @previous_ongoing_leaderboard.name, participant_id: @previous_ongoing_leaderboard.participant_id, post_challenge: @previous_ongoing_leaderboard.post_challenge, previous_row_num: @previous_ongoing_leaderboard.previous_row_num, refreshed_at: @previous_ongoing_leaderboard.refreshed_at, row_num: @previous_ongoing_leaderboard.row_num, score: @previous_ongoing_leaderboard.score, score_secondary: @previous_ongoing_leaderboard.score_secondary, seq: @previous_ongoing_leaderboard.seq, slug: @previous_ongoing_leaderboard.slug, submission_id: @previous_ongoing_leaderboard.submission_id } }
    end

    assert_redirected_to previous_ongoing_leaderboard_url(PreviousOngoingLeaderboard.last)
  end

  test "should show previous_ongoing_leaderboard" do
    get previous_ongoing_leaderboard_url(@previous_ongoing_leaderboard)
    assert_response :success
  end

  test "should get edit" do
    get edit_previous_ongoing_leaderboard_url(@previous_ongoing_leaderboard)
    assert_response :success
  end

  test "should update previous_ongoing_leaderboard" do
    patch previous_ongoing_leaderboard_url(@previous_ongoing_leaderboard), params: { previous_ongoing_leaderboard: { baseline: @previous_ongoing_leaderboard.baseline, baseline_comment: @previous_ongoing_leaderboard.baseline_comment, challenge_id: @previous_ongoing_leaderboard.challenge_id, challenge_round_id: @previous_ongoing_leaderboard.challenge_round_id, description: @previous_ongoing_leaderboard.description, description_markdown: @previous_ongoing_leaderboard.description_markdown, entries: @previous_ongoing_leaderboard.entries, leaderboard_type_cd: @previous_ongoing_leaderboard.leaderboard_type_cd, media_content_type: @previous_ongoing_leaderboard.media_content_type, media_large: @previous_ongoing_leaderboard.media_large, media_thumbnail: @previous_ongoing_leaderboard.media_thumbnail, name: @previous_ongoing_leaderboard.name, participant_id: @previous_ongoing_leaderboard.participant_id, post_challenge: @previous_ongoing_leaderboard.post_challenge, previous_row_num: @previous_ongoing_leaderboard.previous_row_num, refreshed_at: @previous_ongoing_leaderboard.refreshed_at, row_num: @previous_ongoing_leaderboard.row_num, score: @previous_ongoing_leaderboard.score, score_secondary: @previous_ongoing_leaderboard.score_secondary, seq: @previous_ongoing_leaderboard.seq, slug: @previous_ongoing_leaderboard.slug, submission_id: @previous_ongoing_leaderboard.submission_id } }
    assert_redirected_to previous_ongoing_leaderboard_url(@previous_ongoing_leaderboard)
  end

  test "should destroy previous_ongoing_leaderboard" do
    assert_difference('PreviousOngoingLeaderboard.count', -1) do
      delete previous_ongoing_leaderboard_url(@previous_ongoing_leaderboard)
    end

    assert_redirected_to previous_ongoing_leaderboards_url
  end
end
