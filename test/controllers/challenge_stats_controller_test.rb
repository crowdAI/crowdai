require 'test_helper'

class ChallengeStatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @challenge_stat = challenge_stats(:one)
  end

  test "should get index" do
    get challenge_stats_url
    assert_response :success
  end

  test "should get new" do
    get new_challenge_stat_url
    assert_response :success
  end

  test "should create challenge_stat" do
    assert_difference('ChallengeStat.count') do
      post challenge_stats_url, params: { challenge_stat: { challenge: @challenge_stat.challenge, challenge_id: @challenge_stat.challenge_id, challenge_round: @challenge_stat.challenge_round, challenge_round_id: @challenge_stat.challenge_round_id, duration: @challenge_stat.duration, end_dttm: @challenge_stat.end_dttm, participants: @challenge_stat.participants, start_dttm: @challenge_stat.start_dttm, submissions: @challenge_stat.submissions } }
    end

    assert_redirected_to challenge_stat_url(ChallengeStat.last)
  end

  test "should show challenge_stat" do
    get challenge_stat_url(@challenge_stat)
    assert_response :success
  end

  test "should get edit" do
    get edit_challenge_stat_url(@challenge_stat)
    assert_response :success
  end

  test "should update challenge_stat" do
    patch challenge_stat_url(@challenge_stat), params: { challenge_stat: { challenge: @challenge_stat.challenge, challenge_id: @challenge_stat.challenge_id, challenge_round: @challenge_stat.challenge_round, challenge_round_id: @challenge_stat.challenge_round_id, duration: @challenge_stat.duration, end_dttm: @challenge_stat.end_dttm, participants: @challenge_stat.participants, start_dttm: @challenge_stat.start_dttm, submissions: @challenge_stat.submissions } }
    assert_redirected_to challenge_stat_url(@challenge_stat)
  end

  test "should destroy challenge_stat" do
    assert_difference('ChallengeStat.count', -1) do
      delete challenge_stat_url(@challenge_stat)
    end

    assert_redirected_to challenge_stats_url
  end
end
