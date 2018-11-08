require "application_system_test_case"

class EmailPreferencesTest < ApplicationSystemTestCase
  setup do
    @email_preference = email_preferences(:one)
  end

  test "visiting the index" do
    visit email_preferences_url
    assert_selector "h1", text: "Email Preferences"
  end

  test "creating a Email preference" do
    visit email_preferences_url
    click_on "New Email Preference"

    fill_in "Challenges Followed", with: @email_preference.challenges_followed
    fill_in "Email Frequency Cd", with: @email_preference.email_frequency_cd
    fill_in "Mentions", with: @email_preference.mentions
    fill_in "Newsletter", with: @email_preference.newsletter
    fill_in "Participant", with: @email_preference.participant_id
    click_on "Create Email preference"

    assert_text "Email preference was successfully created"
    click_on "Back"
  end

  test "updating a Email preference" do
    visit email_preferences_url
    click_on "Edit", match: :first

    fill_in "Challenges Followed", with: @email_preference.challenges_followed
    fill_in "Email Frequency Cd", with: @email_preference.email_frequency_cd
    fill_in "Mentions", with: @email_preference.mentions
    fill_in "Newsletter", with: @email_preference.newsletter
    fill_in "Participant", with: @email_preference.participant_id
    click_on "Update Email preference"

    assert_text "Email preference was successfully updated"
    click_on "Back"
  end

  test "destroying a Email preference" do
    visit email_preferences_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Email preference was successfully destroyed"
  end
end
