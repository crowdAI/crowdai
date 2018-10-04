require 'test_helper'

class BaseLeaderboardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @base_leaderboard = base_leaderboards(:one)
  end

  test "should get index" do
    get base_leaderboards_url
    assert_response :success
  end

  test "should get new" do
    get new_base_leaderboard_url
    assert_response :success
  end

  test "should create base_leaderboard" do
    assert_difference('BaseLeaderboard.count') do
      post base_leaderboards_url, params: { base_leaderboard: { baseline: @base_leaderboard.baseline, baseline_comment: @base_leaderboard.baseline_comment, challenge_id: @base_leaderboard.challenge_id, challenge_round_id: @base_leaderboard.challenge_round_id, description: @base_leaderboard.description, description_markdown: @base_leaderboard.description_markdown, entries: @base_leaderboard.entries, leaderboard_type_cd: @base_leaderboard.leaderboard_type_cd, media_content_type: @base_leaderboard.media_content_type, media_large: @base_leaderboard.media_large, media_thumbnail: @base_leaderboard.media_thumbnail, name: @base_leaderboard.name, participant_id: @base_leaderboard.participant_id, post_challenge: @base_leaderboard.post_challenge, previous_row_num: @base_leaderboard.previous_row_num, refreshed_at: @base_leaderboard.refreshed_at, row_num: @base_leaderboard.row_num, score: @base_leaderboard.score, score_secondary: @base_leaderboard.score_secondary, seq: @base_leaderboard.seq, slug: @base_leaderboard.slug, submission_id: @base_leaderboard.submission_id } }
    end

    assert_redirected_to base_leaderboard_url(BaseLeaderboard.last)
  end

  test "should show base_leaderboard" do
    get base_leaderboard_url(@base_leaderboard)
    assert_response :success
  end

  test "should get edit" do
    get edit_base_leaderboard_url(@base_leaderboard)
    assert_response :success
  end

  test "should update base_leaderboard" do
    patch base_leaderboard_url(@base_leaderboard), params: { base_leaderboard: { baseline: @base_leaderboard.baseline, baseline_comment: @base_leaderboard.baseline_comment, challenge_id: @base_leaderboard.challenge_id, challenge_round_id: @base_leaderboard.challenge_round_id, description: @base_leaderboard.description, description_markdown: @base_leaderboard.description_markdown, entries: @base_leaderboard.entries, leaderboard_type_cd: @base_leaderboard.leaderboard_type_cd, media_content_type: @base_leaderboard.media_content_type, media_large: @base_leaderboard.media_large, media_thumbnail: @base_leaderboard.media_thumbnail, name: @base_leaderboard.name, participant_id: @base_leaderboard.participant_id, post_challenge: @base_leaderboard.post_challenge, previous_row_num: @base_leaderboard.previous_row_num, refreshed_at: @base_leaderboard.refreshed_at, row_num: @base_leaderboard.row_num, score: @base_leaderboard.score, score_secondary: @base_leaderboard.score_secondary, seq: @base_leaderboard.seq, slug: @base_leaderboard.slug, submission_id: @base_leaderboard.submission_id } }
    assert_redirected_to base_leaderboard_url(@base_leaderboard)
  end

  test "should destroy base_leaderboard" do
    assert_difference('BaseLeaderboard.count', -1) do
      delete base_leaderboard_url(@base_leaderboard)
    end

    assert_redirected_to base_leaderboards_url
  end
end
