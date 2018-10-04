require 'test_helper'

class BadgeStatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @badge_stat = badge_stats(:one)
  end

  test "should get index" do
    get badge_stats_url
    assert_response :success
  end

  test "should get new" do
    get new_badge_stat_url
    assert_response :success
  end

  test "should create badge_stat" do
    assert_difference('BadgeStat.count') do
      post badge_stats_url, params: { badge_stat: { badge_count: @badge_stat.badge_count, badge_id: @badge_stat.badge_id, participant_count: @badge_stat.participant_count, percentile: @badge_stat.percentile } }
    end

    assert_redirected_to badge_stat_url(BadgeStat.last)
  end

  test "should show badge_stat" do
    get badge_stat_url(@badge_stat)
    assert_response :success
  end

  test "should get edit" do
    get edit_badge_stat_url(@badge_stat)
    assert_response :success
  end

  test "should update badge_stat" do
    patch badge_stat_url(@badge_stat), params: { badge_stat: { badge_count: @badge_stat.badge_count, badge_id: @badge_stat.badge_id, participant_count: @badge_stat.participant_count, percentile: @badge_stat.percentile } }
    assert_redirected_to badge_stat_url(@badge_stat)
  end

  test "should destroy badge_stat" do
    assert_difference('BadgeStat.count', -1) do
      delete badge_stat_url(@badge_stat)
    end

    assert_redirected_to badge_stats_url
  end
end
