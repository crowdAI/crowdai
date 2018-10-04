require 'test_helper'

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notification = notifications(:one)
  end

  test "should get index" do
    get notifications_url
    assert_response :success
  end

  test "should get new" do
    get new_notification_url
    assert_response :success
  end

  test "should create notification" do
    assert_difference('Notification.count') do
      post notifications_url, params: { notification: { is_new: @notification.is_new, message: @notification.message, notifiable_id: @notification.notifiable_id, notifiable_type: @notification.notifiable_type, notification_type: @notification.notification_type, notification_url: @notification.notification_url, participant_id: @notification.participant_id, read_at: @notification.read_at, thumbnail_url: @notification.thumbnail_url } }
    end

    assert_redirected_to notification_url(Notification.last)
  end

  test "should show notification" do
    get notification_url(@notification)
    assert_response :success
  end

  test "should get edit" do
    get edit_notification_url(@notification)
    assert_response :success
  end

  test "should update notification" do
    patch notification_url(@notification), params: { notification: { is_new: @notification.is_new, message: @notification.message, notifiable_id: @notification.notifiable_id, notifiable_type: @notification.notifiable_type, notification_type: @notification.notification_type, notification_url: @notification.notification_url, participant_id: @notification.participant_id, read_at: @notification.read_at, thumbnail_url: @notification.thumbnail_url } }
    assert_redirected_to notification_url(@notification)
  end

  test "should destroy notification" do
    assert_difference('Notification.count', -1) do
      delete notification_url(@notification)
    end

    assert_redirected_to notifications_url
  end
end
