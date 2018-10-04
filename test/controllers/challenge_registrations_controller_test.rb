require 'test_helper'

class ChallengeRegistrationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @challenge_registration = challenge_registrations(:one)
  end

  test "should get index" do
    get challenge_registrations_url
    assert_response :success
  end

  test "should get new" do
    get new_challenge_registration_url
    assert_response :success
  end

  test "should create challenge_registration" do
    assert_difference('ChallengeRegistration.count') do
      post challenge_registrations_url, params: { challenge_registration: { challenge_id: @challenge_registration.challenge_id, clef_task_id: @challenge_registration.clef_task_id, participant_id: @challenge_registration.participant_id, registration_type: @challenge_registration.registration_type } }
    end

    assert_redirected_to challenge_registration_url(ChallengeRegistration.last)
  end

  test "should show challenge_registration" do
    get challenge_registration_url(@challenge_registration)
    assert_response :success
  end

  test "should get edit" do
    get edit_challenge_registration_url(@challenge_registration)
    assert_response :success
  end

  test "should update challenge_registration" do
    patch challenge_registration_url(@challenge_registration), params: { challenge_registration: { challenge_id: @challenge_registration.challenge_id, clef_task_id: @challenge_registration.clef_task_id, participant_id: @challenge_registration.participant_id, registration_type: @challenge_registration.registration_type } }
    assert_redirected_to challenge_registration_url(@challenge_registration)
  end

  test "should destroy challenge_registration" do
    assert_difference('ChallengeRegistration.count', -1) do
      delete challenge_registration_url(@challenge_registration)
    end

    assert_redirected_to challenge_registrations_url
  end
end
