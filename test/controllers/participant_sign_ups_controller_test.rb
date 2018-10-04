require 'test_helper'

class ParticipantSignUpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @participant_sign_up = participant_sign_ups(:one)
  end

  test "should get index" do
    get participant_sign_ups_url
    assert_response :success
  end

  test "should get new" do
    get new_participant_sign_up_url
    assert_response :success
  end

  test "should create participant_sign_up" do
    assert_difference('ParticipantSignUp.count') do
      post participant_sign_ups_url, params: { participant_sign_up: { count: @participant_sign_up.count, mnth: @participant_sign_up.mnth, yr: @participant_sign_up.yr } }
    end

    assert_redirected_to participant_sign_up_url(ParticipantSignUp.last)
  end

  test "should show participant_sign_up" do
    get participant_sign_up_url(@participant_sign_up)
    assert_response :success
  end

  test "should get edit" do
    get edit_participant_sign_up_url(@participant_sign_up)
    assert_response :success
  end

  test "should update participant_sign_up" do
    patch participant_sign_up_url(@participant_sign_up), params: { participant_sign_up: { count: @participant_sign_up.count, mnth: @participant_sign_up.mnth, yr: @participant_sign_up.yr } }
    assert_redirected_to participant_sign_up_url(@participant_sign_up)
  end

  test "should destroy participant_sign_up" do
    assert_difference('ParticipantSignUp.count', -1) do
      delete participant_sign_up_url(@participant_sign_up)
    end

    assert_redirected_to participant_sign_ups_url
  end
end
