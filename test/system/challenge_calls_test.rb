require "application_system_test_case"

class ChallengeCallsTest < ApplicationSystemTestCase
  setup do
    @challenge_call = challenge_calls(:one)
  end

  test "visiting the index" do
    visit challenge_calls_url
    assert_selector "h1", text: "Challenge Calls"
  end

  test "creating a Challenge call" do
    visit challenge_calls_url
    click_on "New Challenge Call"

    fill_in "Closing Date", with: @challenge_call.closing_date
    fill_in "Crowdai", with: @challenge_call.crowdai
    fill_in "Description", with: @challenge_call.description
    fill_in "Description Markdown", with: @challenge_call.description_markdown
    fill_in "Headline", with: @challenge_call.headline
    fill_in "Organizer", with: @challenge_call.organizer_id
    fill_in "Slug", with: @challenge_call.slug
    fill_in "Title", with: @challenge_call.title
    fill_in "Website", with: @challenge_call.website
    click_on "Create Challenge call"

    assert_text "Challenge call was successfully created"
    click_on "Back"
  end

  test "updating a Challenge call" do
    visit challenge_calls_url
    click_on "Edit", match: :first

    fill_in "Closing Date", with: @challenge_call.closing_date
    fill_in "Crowdai", with: @challenge_call.crowdai
    fill_in "Description", with: @challenge_call.description
    fill_in "Description Markdown", with: @challenge_call.description_markdown
    fill_in "Headline", with: @challenge_call.headline
    fill_in "Organizer", with: @challenge_call.organizer_id
    fill_in "Slug", with: @challenge_call.slug
    fill_in "Title", with: @challenge_call.title
    fill_in "Website", with: @challenge_call.website
    click_on "Update Challenge call"

    assert_text "Challenge call was successfully updated"
    click_on "Back"
  end

  test "destroying a Challenge call" do
    visit challenge_calls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Challenge call was successfully destroyed"
  end
end
