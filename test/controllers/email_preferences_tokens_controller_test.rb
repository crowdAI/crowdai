require 'test_helper'

class EmailPreferencesTokensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @email_preferences_token = email_preferences_tokens(:one)
  end

  test "should get index" do
    get email_preferences_tokens_url
    assert_response :success
  end

  test "should get new" do
    get new_email_preferences_token_url
    assert_response :success
  end

  test "should create email_preferences_token" do
    assert_difference('EmailPreferencesToken.count') do
      post email_preferences_tokens_url, params: { email_preferences_token: { email_preferences_token: @email_preferences_token.email_preferences_token, participant_id: @email_preferences_token.participant_id, token_expiration_dttm: @email_preferences_token.token_expiration_dttm } }
    end

    assert_redirected_to email_preferences_token_url(EmailPreferencesToken.last)
  end

  test "should show email_preferences_token" do
    get email_preferences_token_url(@email_preferences_token)
    assert_response :success
  end

  test "should get edit" do
    get edit_email_preferences_token_url(@email_preferences_token)
    assert_response :success
  end

  test "should update email_preferences_token" do
    patch email_preferences_token_url(@email_preferences_token), params: { email_preferences_token: { email_preferences_token: @email_preferences_token.email_preferences_token, participant_id: @email_preferences_token.participant_id, token_expiration_dttm: @email_preferences_token.token_expiration_dttm } }
    assert_redirected_to email_preferences_token_url(@email_preferences_token)
  end

  test "should destroy email_preferences_token" do
    assert_difference('EmailPreferencesToken.count', -1) do
      delete email_preferences_token_url(@email_preferences_token)
    end

    assert_redirected_to email_preferences_tokens_url
  end
end
