require "application_system_test_case"

class EmailPreferencesTokensTest < ApplicationSystemTestCase
  setup do
    @email_preferences_token = email_preferences_tokens(:one)
  end

  test "visiting the index" do
    visit email_preferences_tokens_url
    assert_selector "h1", text: "Email Preferences Tokens"
  end

  test "creating a Email preferences token" do
    visit email_preferences_tokens_url
    click_on "New Email Preferences Token"

    fill_in "Email Preferences Token", with: @email_preferences_token.email_preferences_token
    fill_in "Participant", with: @email_preferences_token.participant_id
    fill_in "Token Expiration Dttm", with: @email_preferences_token.token_expiration_dttm
    click_on "Create Email preferences token"

    assert_text "Email preferences token was successfully created"
    click_on "Back"
  end

  test "updating a Email preferences token" do
    visit email_preferences_tokens_url
    click_on "Edit", match: :first

    fill_in "Email Preferences Token", with: @email_preferences_token.email_preferences_token
    fill_in "Participant", with: @email_preferences_token.participant_id
    fill_in "Token Expiration Dttm", with: @email_preferences_token.token_expiration_dttm
    click_on "Update Email preferences token"

    assert_text "Email preferences token was successfully updated"
    click_on "Back"
  end

  test "destroying a Email preferences token" do
    visit email_preferences_tokens_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Email preferences token was successfully destroyed"
  end
end
