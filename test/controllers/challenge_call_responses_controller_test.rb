require 'test_helper'

class ChallengeCallResponsesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @challenge_call_response = challenge_call_responses(:one)
  end

  test "should get index" do
    get challenge_call_responses_url
    assert_response :success
  end

  test "should get new" do
    get new_challenge_call_response_url
    assert_response :success
  end

  test "should create challenge_call_response" do
    assert_difference('ChallengeCallResponse.count') do
      post challenge_call_responses_url, params: { challenge_call_response: { challenge_call_id: @challenge_call_response.challenge_call_id, challenge_description: @challenge_call_response.challenge_description, challenge_title: @challenge_call_response.challenge_title, contact_name: @challenge_call_response.contact_name, email: @challenge_call_response.email, evaluation_criteria: @challenge_call_response.evaluation_criteria, motivation: @challenge_call_response.motivation, organization: @challenge_call_response.organization, organizers_bio: @challenge_call_response.organizers_bio, other: @challenge_call_response.other, phone: @challenge_call_response.phone, timeline: @challenge_call_response.timeline } }
    end

    assert_redirected_to challenge_call_response_url(ChallengeCallResponse.last)
  end

  test "should show challenge_call_response" do
    get challenge_call_response_url(@challenge_call_response)
    assert_response :success
  end

  test "should get edit" do
    get edit_challenge_call_response_url(@challenge_call_response)
    assert_response :success
  end

  test "should update challenge_call_response" do
    patch challenge_call_response_url(@challenge_call_response), params: { challenge_call_response: { challenge_call_id: @challenge_call_response.challenge_call_id, challenge_description: @challenge_call_response.challenge_description, challenge_title: @challenge_call_response.challenge_title, contact_name: @challenge_call_response.contact_name, email: @challenge_call_response.email, evaluation_criteria: @challenge_call_response.evaluation_criteria, motivation: @challenge_call_response.motivation, organization: @challenge_call_response.organization, organizers_bio: @challenge_call_response.organizers_bio, other: @challenge_call_response.other, phone: @challenge_call_response.phone, timeline: @challenge_call_response.timeline } }
    assert_redirected_to challenge_call_response_url(@challenge_call_response)
  end

  test "should destroy challenge_call_response" do
    assert_difference('ChallengeCallResponse.count', -1) do
      delete challenge_call_response_url(@challenge_call_response)
    end

    assert_redirected_to challenge_call_responses_url
  end
end
