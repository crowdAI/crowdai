require "application_system_test_case"

class LoginActivitiesTest < ApplicationSystemTestCase
  setup do
    @login_activity = login_activities(:one)
  end

  test "visiting the index" do
    visit login_activities_url
    assert_selector "h1", text: "Login Activities"
  end

  test "creating a Login activity" do
    visit login_activities_url
    click_on "New Login Activity"

    fill_in "City", with: @login_activity.city
    fill_in "Context", with: @login_activity.context
    fill_in "Country", with: @login_activity.country
    fill_in "Failure Reason", with: @login_activity.failure_reason
    fill_in "Identity", with: @login_activity.identity
    fill_in "Ip", with: @login_activity.ip
    fill_in "Referrer", with: @login_activity.referrer
    fill_in "Region", with: @login_activity.region
    fill_in "Scope", with: @login_activity.scope
    fill_in "Strategy", with: @login_activity.strategy
    fill_in "Success", with: @login_activity.success
    fill_in "User Agent", with: @login_activity.user_agent
    fill_in "User", with: @login_activity.user_id
    fill_in "User Type", with: @login_activity.user_type
    click_on "Create Login activity"

    assert_text "Login activity was successfully created"
    click_on "Back"
  end

  test "updating a Login activity" do
    visit login_activities_url
    click_on "Edit", match: :first

    fill_in "City", with: @login_activity.city
    fill_in "Context", with: @login_activity.context
    fill_in "Country", with: @login_activity.country
    fill_in "Failure Reason", with: @login_activity.failure_reason
    fill_in "Identity", with: @login_activity.identity
    fill_in "Ip", with: @login_activity.ip
    fill_in "Referrer", with: @login_activity.referrer
    fill_in "Region", with: @login_activity.region
    fill_in "Scope", with: @login_activity.scope
    fill_in "Strategy", with: @login_activity.strategy
    fill_in "Success", with: @login_activity.success
    fill_in "User Agent", with: @login_activity.user_agent
    fill_in "User", with: @login_activity.user_id
    fill_in "User Type", with: @login_activity.user_type
    click_on "Update Login activity"

    assert_text "Login activity was successfully updated"
    click_on "Back"
  end

  test "destroying a Login activity" do
    visit login_activities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Login activity was successfully destroyed"
  end
end
