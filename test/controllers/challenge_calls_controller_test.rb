require 'test_helper'

class ChallengeCallsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @challenge_call = challenge_calls(:one)
  end

  test "should get index" do
    get challenge_calls_url
    assert_response :success
  end

  test "should get new" do
    get new_challenge_call_url
    assert_response :success
  end

  test "should create challenge_call" do
    assert_difference('ChallengeCall.count') do
      post challenge_calls_url, params: { challenge_call: { closing_date: @challenge_call.closing_date, crowdai: @challenge_call.crowdai, description: @challenge_call.description, description_markdown: @challenge_call.description_markdown, headline: @challenge_call.headline, organizer_id: @challenge_call.organizer_id, slug: @challenge_call.slug, title: @challenge_call.title, website: @challenge_call.website } }
    end

    assert_redirected_to challenge_call_url(ChallengeCall.last)
  end

  test "should show challenge_call" do
    get challenge_call_url(@challenge_call)
    assert_response :success
  end

  test "should get edit" do
    get edit_challenge_call_url(@challenge_call)
    assert_response :success
  end

  test "should update challenge_call" do
    patch challenge_call_url(@challenge_call), params: { challenge_call: { closing_date: @challenge_call.closing_date, crowdai: @challenge_call.crowdai, description: @challenge_call.description, description_markdown: @challenge_call.description_markdown, headline: @challenge_call.headline, organizer_id: @challenge_call.organizer_id, slug: @challenge_call.slug, title: @challenge_call.title, website: @challenge_call.website } }
    assert_redirected_to challenge_call_url(@challenge_call)
  end

  test "should destroy challenge_call" do
    assert_difference('ChallengeCall.count', -1) do
      delete challenge_call_url(@challenge_call)
    end

    assert_redirected_to challenge_calls_url
  end
end
