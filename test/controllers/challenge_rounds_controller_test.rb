require 'test_helper'

class ChallengeRoundsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @challenge_round = challenge_rounds(:one)
  end

  test "should get index" do
    get challenge_rounds_url
    assert_response :success
  end

  test "should get new" do
    get new_challenge_round_url
    assert_response :success
  end

  test "should create challenge_round" do
    assert_difference('ChallengeRound.count') do
      post challenge_rounds_url, params: { challenge_round: { active: @challenge_round.active, challenge_id: @challenge_round.challenge_id, challenge_round: @challenge_round.challenge_round, end_dttm: @challenge_round.end_dttm, failed_submissions: @challenge_round.failed_submissions, leaderboard_note: @challenge_round.leaderboard_note, leaderboard_note_markdown: @challenge_round.leaderboard_note_markdown, minimum_score: @challenge_round.minimum_score, minimum_score_secondary: @challenge_round.minimum_score_secondary, ranking_highlight: @challenge_round.ranking_highlight, ranking_window: @challenge_round.ranking_window, score_precision: @challenge_round.score_precision, score_secondary_precision: @challenge_round.score_secondary_precision, start_dttm: @challenge_round.start_dttm, submission_limit: @challenge_round.submission_limit, submission_limit_period_cd: @challenge_round.submission_limit_period_cd } }
    end

    assert_redirected_to challenge_round_url(ChallengeRound.last)
  end

  test "should show challenge_round" do
    get challenge_round_url(@challenge_round)
    assert_response :success
  end

  test "should get edit" do
    get edit_challenge_round_url(@challenge_round)
    assert_response :success
  end

  test "should update challenge_round" do
    patch challenge_round_url(@challenge_round), params: { challenge_round: { active: @challenge_round.active, challenge_id: @challenge_round.challenge_id, challenge_round: @challenge_round.challenge_round, end_dttm: @challenge_round.end_dttm, failed_submissions: @challenge_round.failed_submissions, leaderboard_note: @challenge_round.leaderboard_note, leaderboard_note_markdown: @challenge_round.leaderboard_note_markdown, minimum_score: @challenge_round.minimum_score, minimum_score_secondary: @challenge_round.minimum_score_secondary, ranking_highlight: @challenge_round.ranking_highlight, ranking_window: @challenge_round.ranking_window, score_precision: @challenge_round.score_precision, score_secondary_precision: @challenge_round.score_secondary_precision, start_dttm: @challenge_round.start_dttm, submission_limit: @challenge_round.submission_limit, submission_limit_period_cd: @challenge_round.submission_limit_period_cd } }
    assert_redirected_to challenge_round_url(@challenge_round)
  end

  test "should destroy challenge_round" do
    assert_difference('ChallengeRound.count', -1) do
      delete challenge_round_url(@challenge_round)
    end

    assert_redirected_to challenge_rounds_url
  end
end
