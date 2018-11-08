require 'test_helper'

class LoginActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @login_activity = login_activities(:one)
  end

  test "should get index" do
    get login_activities_url
    assert_response :success
  end

  test "should get new" do
    get new_login_activity_url
    assert_response :success
  end

  test "should create login_activity" do
    assert_difference('LoginActivity.count') do
      post login_activities_url, params: { login_activity: { city: @login_activity.city, context: @login_activity.context, country: @login_activity.country, failure_reason: @login_activity.failure_reason, identity: @login_activity.identity, ip: @login_activity.ip, referrer: @login_activity.referrer, region: @login_activity.region, scope: @login_activity.scope, strategy: @login_activity.strategy, success: @login_activity.success, user_agent: @login_activity.user_agent, user_id: @login_activity.user_id, user_type: @login_activity.user_type } }
    end

    assert_redirected_to login_activity_url(LoginActivity.last)
  end

  test "should show login_activity" do
    get login_activity_url(@login_activity)
    assert_response :success
  end

  test "should get edit" do
    get edit_login_activity_url(@login_activity)
    assert_response :success
  end

  test "should update login_activity" do
    patch login_activity_url(@login_activity), params: { login_activity: { city: @login_activity.city, context: @login_activity.context, country: @login_activity.country, failure_reason: @login_activity.failure_reason, identity: @login_activity.identity, ip: @login_activity.ip, referrer: @login_activity.referrer, region: @login_activity.region, scope: @login_activity.scope, strategy: @login_activity.strategy, success: @login_activity.success, user_agent: @login_activity.user_agent, user_id: @login_activity.user_id, user_type: @login_activity.user_type } }
    assert_redirected_to login_activity_url(@login_activity)
  end

  test "should destroy login_activity" do
    assert_difference('LoginActivity.count', -1) do
      delete login_activity_url(@login_activity)
    end

    assert_redirected_to login_activities_url
  end
end
