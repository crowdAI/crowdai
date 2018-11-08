require 'test_helper'

class LeaderboardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @leaderboard = leaderboards(:one)
  end

  test "should get index" do
    get leaderboards_url
    assert_response :success
  end

  test "should get new" do
    get new_leaderboard_url
    assert_response :success
  end

  test "should create leaderboard" do
    assert_difference('Leaderboard.count') do
      post leaderboards_url, params: { leaderboard: { baseline: @leaderboard.baseline, baseline_comment: @leaderboard.baseline_comment, challenge_id: @leaderboard.challenge_id, challenge_round_id: @leaderboard.challenge_round_id, description: @leaderboard.description, description_markdown: @leaderboard.description_markdown, entries: @leaderboard.entries, leaderboard_type_cd: @leaderboard.leaderboard_type_cd, media_content_type: @leaderboard.media_content_type, media_large: @leaderboard.media_large, media_thumbnail: @leaderboard.media_thumbnail, name: @leaderboard.name, participant_id: @leaderboard.participant_id, post_challenge: @leaderboard.post_challenge, previous_row_num: @leaderboard.previous_row_num, refreshed_at: @leaderboard.refreshed_at, row_num: @leaderboard.row_num, score: @leaderboard.score, score_secondary: @leaderboard.score_secondary, seq: @leaderboard.seq, slug: @leaderboard.slug, submission_id: @leaderboard.submission_id } }
    end

    assert_redirected_to leaderboard_url(Leaderboard.last)
  end

  test "should show leaderboard" do
    get leaderboard_url(@leaderboard)
    assert_response :success
  end

  test "should get edit" do
    get edit_leaderboard_url(@leaderboard)
    assert_response :success
  end

  test "should update leaderboard" do
    patch leaderboard_url(@leaderboard), params: { leaderboard: { baseline: @leaderboard.baseline, baseline_comment: @leaderboard.baseline_comment, challenge_id: @leaderboard.challenge_id, challenge_round_id: @leaderboard.challenge_round_id, description: @leaderboard.description, description_markdown: @leaderboard.description_markdown, entries: @leaderboard.entries, leaderboard_type_cd: @leaderboard.leaderboard_type_cd, media_content_type: @leaderboard.media_content_type, media_large: @leaderboard.media_large, media_thumbnail: @leaderboard.media_thumbnail, name: @leaderboard.name, participant_id: @leaderboard.participant_id, post_challenge: @leaderboard.post_challenge, previous_row_num: @leaderboard.previous_row_num, refreshed_at: @leaderboard.refreshed_at, row_num: @leaderboard.row_num, score: @leaderboard.score, score_secondary: @leaderboard.score_secondary, seq: @leaderboard.seq, slug: @leaderboard.slug, submission_id: @leaderboard.submission_id } }
    assert_redirected_to leaderboard_url(@leaderboard)
  end

  test "should destroy leaderboard" do
    assert_difference('Leaderboard.count', -1) do
      delete leaderboard_url(@leaderboard)
    end

    assert_redirected_to leaderboards_url
  end
end
