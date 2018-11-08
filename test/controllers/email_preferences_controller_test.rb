require 'test_helper'

class EmailPreferencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @email_preference = email_preferences(:one)
  end

  test "should get index" do
    get email_preferences_url
    assert_response :success
  end

  test "should get new" do
    get new_email_preference_url
    assert_response :success
  end

  test "should create email_preference" do
    assert_difference('EmailPreference.count') do
      post email_preferences_url, params: { email_preference: { challenges_followed: @email_preference.challenges_followed, email_frequency_cd: @email_preference.email_frequency_cd, mentions: @email_preference.mentions, newsletter: @email_preference.newsletter, participant_id: @email_preference.participant_id } }
    end

    assert_redirected_to email_preference_url(EmailPreference.last)
  end

  test "should show email_preference" do
    get email_preference_url(@email_preference)
    assert_response :success
  end

  test "should get edit" do
    get edit_email_preference_url(@email_preference)
    assert_response :success
  end

  test "should update email_preference" do
    patch email_preference_url(@email_preference), params: { email_preference: { challenges_followed: @email_preference.challenges_followed, email_frequency_cd: @email_preference.email_frequency_cd, mentions: @email_preference.mentions, newsletter: @email_preference.newsletter, participant_id: @email_preference.participant_id } }
    assert_redirected_to email_preference_url(@email_preference)
  end

  test "should destroy email_preference" do
    assert_difference('EmailPreference.count', -1) do
      delete email_preference_url(@email_preference)
    end

    assert_redirected_to email_preferences_url
  end
end
