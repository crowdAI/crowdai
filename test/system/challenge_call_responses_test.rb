require "application_system_test_case"

class ChallengeCallResponsesTest < ApplicationSystemTestCase
  setup do
    @challenge_call_response = challenge_call_responses(:one)
  end

  test "visiting the index" do
    visit challenge_call_responses_url
    assert_selector "h1", text: "Challenge Call Responses"
  end

  test "creating a Challenge call response" do
    visit challenge_call_responses_url
    click_on "New Challenge Call Response"

    fill_in "Challenge Call", with: @challenge_call_response.challenge_call_id
    fill_in "Challenge Description", with: @challenge_call_response.challenge_description
    fill_in "Challenge Title", with: @challenge_call_response.challenge_title
    fill_in "Contact Name", with: @challenge_call_response.contact_name
    fill_in "Email", with: @challenge_call_response.email
    fill_in "Evaluation Criteria", with: @challenge_call_response.evaluation_criteria
    fill_in "Motivation", with: @challenge_call_response.motivation
    fill_in "Organization", with: @challenge_call_response.organization
    fill_in "Organizers Bio", with: @challenge_call_response.organizers_bio
    fill_in "Other", with: @challenge_call_response.other
    fill_in "Phone", with: @challenge_call_response.phone
    fill_in "Timeline", with: @challenge_call_response.timeline
    click_on "Create Challenge call response"

    assert_text "Challenge call response was successfully created"
    click_on "Back"
  end

  test "updating a Challenge call response" do
    visit challenge_call_responses_url
    click_on "Edit", match: :first

    fill_in "Challenge Call", with: @challenge_call_response.challenge_call_id
    fill_in "Challenge Description", with: @challenge_call_response.challenge_description
    fill_in "Challenge Title", with: @challenge_call_response.challenge_title
    fill_in "Contact Name", with: @challenge_call_response.contact_name
    fill_in "Email", with: @challenge_call_response.email
    fill_in "Evaluation Criteria", with: @challenge_call_response.evaluation_criteria
    fill_in "Motivation", with: @challenge_call_response.motivation
    fill_in "Organization", with: @challenge_call_response.organization
    fill_in "Organizers Bio", with: @challenge_call_response.organizers_bio
    fill_in "Other", with: @challenge_call_response.other
    fill_in "Phone", with: @challenge_call_response.phone
    fill_in "Timeline", with: @challenge_call_response.timeline
    click_on "Update Challenge call response"

    assert_text "Challenge call response was successfully updated"
    click_on "Back"
  end

  test "destroying a Challenge call response" do
    visit challenge_call_responses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Challenge call response was successfully destroyed"
  end
end
