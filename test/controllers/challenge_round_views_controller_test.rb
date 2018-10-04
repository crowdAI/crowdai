require 'test_helper'

class ChallengeRoundViewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @challenge_round_view = challenge_round_views(:one)
  end

  test "should get index" do
    get challenge_round_views_url
    assert_response :success
  end

  test "should get new" do
    get new_challenge_round_view_url
    assert_response :success
  end

  test "should create challenge_round_view" do
    assert_difference('ChallengeRoundView.count') do
      post challenge_round_views_url, params: { challenge_round_view: { active: @challenge_round_view.active, challenge_id: @challenge_round_view.challenge_id, challenge_round: @challenge_round_view.challenge_round, end_dttm: @challenge_round_view.end_dttm, failed_submissions: @challenge_round_view.failed_submissions, minimum_score: @challenge_round_view.minimum_score, minimum_score_secondary: @challenge_round_view.minimum_score_secondary, row_num: @challenge_round_view.row_num, start_dttm: @challenge_round_view.start_dttm, submission_limit: @challenge_round_view.submission_limit, submission_limit_period_cd: @challenge_round_view.submission_limit_period_cd } }
    end

    assert_redirected_to challenge_round_view_url(ChallengeRoundView.last)
  end

  test "should show challenge_round_view" do
    get challenge_round_view_url(@challenge_round_view)
    assert_response :success
  end

  test "should get edit" do
    get edit_challenge_round_view_url(@challenge_round_view)
    assert_response :success
  end

  test "should update challenge_round_view" do
    patch challenge_round_view_url(@challenge_round_view), params: { challenge_round_view: { active: @challenge_round_view.active, challenge_id: @challenge_round_view.challenge_id, challenge_round: @challenge_round_view.challenge_round, end_dttm: @challenge_round_view.end_dttm, failed_submissions: @challenge_round_view.failed_submissions, minimum_score: @challenge_round_view.minimum_score, minimum_score_secondary: @challenge_round_view.minimum_score_secondary, row_num: @challenge_round_view.row_num, start_dttm: @challenge_round_view.start_dttm, submission_limit: @challenge_round_view.submission_limit, submission_limit_period_cd: @challenge_round_view.submission_limit_period_cd } }
    assert_redirected_to challenge_round_view_url(@challenge_round_view)
  end

  test "should destroy challenge_round_view" do
    assert_difference('ChallengeRoundView.count', -1) do
      delete challenge_round_view_url(@challenge_round_view)
    end

    assert_redirected_to challenge_round_views_url
  end
end
