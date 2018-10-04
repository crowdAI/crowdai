require 'test_helper'

class ChallengeRoundSummariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @challenge_round_summary = challenge_round_summaries(:one)
  end

  test "should get index" do
    get challenge_round_summaries_url
    assert_response :success
  end

  test "should get new" do
    get new_challenge_round_summary_url
    assert_response :success
  end

  test "should create challenge_round_summary" do
    assert_difference('ChallengeRoundSummary.count') do
      post challenge_round_summaries_url, params: { challenge_round_summary: { active: @challenge_round_summary.active, active_row_num: @challenge_round_summary.active_row_num, challenge_id: @challenge_round_summary.challenge_id, challenge_round: @challenge_round_summary.challenge_round, end_dttm: @challenge_round_summary.end_dttm, failed_submissions: @challenge_round_summary.failed_submissions, minimum_score: @challenge_round_summary.minimum_score, minimum_score_secondary: @challenge_round_summary.minimum_score_secondary, round_status_cd: @challenge_round_summary.round_status_cd, row_num: @challenge_round_summary.row_num, start_dttm: @challenge_round_summary.start_dttm, status_cd: @challenge_round_summary.status_cd, submission_limit: @challenge_round_summary.submission_limit, submission_limit_period_cd: @challenge_round_summary.submission_limit_period_cd } }
    end

    assert_redirected_to challenge_round_summary_url(ChallengeRoundSummary.last)
  end

  test "should show challenge_round_summary" do
    get challenge_round_summary_url(@challenge_round_summary)
    assert_response :success
  end

  test "should get edit" do
    get edit_challenge_round_summary_url(@challenge_round_summary)
    assert_response :success
  end

  test "should update challenge_round_summary" do
    patch challenge_round_summary_url(@challenge_round_summary), params: { challenge_round_summary: { active: @challenge_round_summary.active, active_row_num: @challenge_round_summary.active_row_num, challenge_id: @challenge_round_summary.challenge_id, challenge_round: @challenge_round_summary.challenge_round, end_dttm: @challenge_round_summary.end_dttm, failed_submissions: @challenge_round_summary.failed_submissions, minimum_score: @challenge_round_summary.minimum_score, minimum_score_secondary: @challenge_round_summary.minimum_score_secondary, round_status_cd: @challenge_round_summary.round_status_cd, row_num: @challenge_round_summary.row_num, start_dttm: @challenge_round_summary.start_dttm, status_cd: @challenge_round_summary.status_cd, submission_limit: @challenge_round_summary.submission_limit, submission_limit_period_cd: @challenge_round_summary.submission_limit_period_cd } }
    assert_redirected_to challenge_round_summary_url(@challenge_round_summary)
  end

  test "should destroy challenge_round_summary" do
    assert_difference('ChallengeRoundSummary.count', -1) do
      delete challenge_round_summary_url(@challenge_round_summary)
    end

    assert_redirected_to challenge_round_summaries_url
  end
end
