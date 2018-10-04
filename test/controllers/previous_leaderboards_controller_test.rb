require 'test_helper'

class PreviousLeaderboardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @previous_leaderboard = previous_leaderboards(:one)
  end

  test "should get index" do
    get previous_leaderboards_url
    assert_response :success
  end

  test "should get new" do
    get new_previous_leaderboard_url
    assert_response :success
  end

  test "should create previous_leaderboard" do
    assert_difference('PreviousLeaderboard.count') do
      post previous_leaderboards_url, params: { previous_leaderboard: { baseline: @previous_leaderboard.baseline, baseline_comment: @previous_leaderboard.baseline_comment, challenge_id: @previous_leaderboard.challenge_id, challenge_round_id: @previous_leaderboard.challenge_round_id, description: @previous_leaderboard.description, description_markdown: @previous_leaderboard.description_markdown, entries: @previous_leaderboard.entries, leaderboard_type_cd: @previous_leaderboard.leaderboard_type_cd, media_content_type: @previous_leaderboard.media_content_type, media_large: @previous_leaderboard.media_large, media_thumbnail: @previous_leaderboard.media_thumbnail, name: @previous_leaderboard.name, participant_id: @previous_leaderboard.participant_id, post_challenge: @previous_leaderboard.post_challenge, previous_row_num: @previous_leaderboard.previous_row_num, refreshed_at: @previous_leaderboard.refreshed_at, row_num: @previous_leaderboard.row_num, score: @previous_leaderboard.score, score_secondary: @previous_leaderboard.score_secondary, seq: @previous_leaderboard.seq, slug: @previous_leaderboard.slug, submission_id: @previous_leaderboard.submission_id } }
    end

    assert_redirected_to previous_leaderboard_url(PreviousLeaderboard.last)
  end

  test "should show previous_leaderboard" do
    get previous_leaderboard_url(@previous_leaderboard)
    assert_response :success
  end

  test "should get edit" do
    get edit_previous_leaderboard_url(@previous_leaderboard)
    assert_response :success
  end

  test "should update previous_leaderboard" do
    patch previous_leaderboard_url(@previous_leaderboard), params: { previous_leaderboard: { baseline: @previous_leaderboard.baseline, baseline_comment: @previous_leaderboard.baseline_comment, challenge_id: @previous_leaderboard.challenge_id, challenge_round_id: @previous_leaderboard.challenge_round_id, description: @previous_leaderboard.description, description_markdown: @previous_leaderboard.description_markdown, entries: @previous_leaderboard.entries, leaderboard_type_cd: @previous_leaderboard.leaderboard_type_cd, media_content_type: @previous_leaderboard.media_content_type, media_large: @previous_leaderboard.media_large, media_thumbnail: @previous_leaderboard.media_thumbnail, name: @previous_leaderboard.name, participant_id: @previous_leaderboard.participant_id, post_challenge: @previous_leaderboard.post_challenge, previous_row_num: @previous_leaderboard.previous_row_num, refreshed_at: @previous_leaderboard.refreshed_at, row_num: @previous_leaderboard.row_num, score: @previous_leaderboard.score, score_secondary: @previous_leaderboard.score_secondary, seq: @previous_leaderboard.seq, slug: @previous_leaderboard.slug, submission_id: @previous_leaderboard.submission_id } }
    assert_redirected_to previous_leaderboard_url(@previous_leaderboard)
  end

  test "should destroy previous_leaderboard" do
    assert_difference('PreviousLeaderboard.count', -1) do
      delete previous_leaderboard_url(@previous_leaderboard)
    end

    assert_redirected_to previous_leaderboards_url
  end
end
