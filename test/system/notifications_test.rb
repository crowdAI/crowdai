require "application_system_test_case"

class NotificationsTest < ApplicationSystemTestCase
  setup do
    @notification = notifications(:one)
  end

  test "visiting the index" do
    visit notifications_url
    assert_selector "h1", text: "Notifications"
  end

  test "creating a Notification" do
    visit notifications_url
    click_on "New Notification"

    fill_in "Is New", with: @notification.is_new
    fill_in "Message", with: @notification.message
    fill_in "Notifiable", with: @notification.notifiable_id
    fill_in "Notifiable Type", with: @notification.notifiable_type
    fill_in "Notification Type", with: @notification.notification_type
    fill_in "Notification Url", with: @notification.notification_url
    fill_in "Participant", with: @notification.participant_id
    fill_in "Read At", with: @notification.read_at
    fill_in "Thumbnail Url", with: @notification.thumbnail_url
    click_on "Create Notification"

    assert_text "Notification was successfully created"
    click_on "Back"
  end

  test "updating a Notification" do
    visit notifications_url
    click_on "Edit", match: :first

    fill_in "Is New", with: @notification.is_new
    fill_in "Message", with: @notification.message
    fill_in "Notifiable", with: @notification.notifiable_id
    fill_in "Notifiable Type", with: @notification.notifiable_type
    fill_in "Notification Type", with: @notification.notification_type
    fill_in "Notification Url", with: @notification.notification_url
    fill_in "Participant", with: @notification.participant_id
    fill_in "Read At", with: @notification.read_at
    fill_in "Thumbnail Url", with: @notification.thumbnail_url
    click_on "Update Notification"

    assert_text "Notification was successfully updated"
    click_on "Back"
  end

  test "destroying a Notification" do
    visit notifications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Notification was successfully destroyed"
  end
end
