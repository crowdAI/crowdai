require 'test_helper'

class ParticipantChallengeCountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @participant_challenge_count = participant_challenge_counts(:one)
  end

  test "should get index" do
    get participant_challenge_counts_url
    assert_response :success
  end

  test "should get new" do
    get new_participant_challenge_count_url
    assert_response :success
  end

  test "should create participant_challenge_count" do
    assert_difference('ParticipantChallengeCount.count') do
      post participant_challenge_counts_url, params: { participant_challenge_count: { challenge_id: @participant_challenge_count.challenge_id, participant_id: @participant_challenge_count.participant_id, registration_type: @participant_challenge_count.registration_type, row_number: @participant_challenge_count.row_number } }
    end

    assert_redirected_to participant_challenge_count_url(ParticipantChallengeCount.last)
  end

  test "should show participant_challenge_count" do
    get participant_challenge_count_url(@participant_challenge_count)
    assert_response :success
  end

  test "should get edit" do
    get edit_participant_challenge_count_url(@participant_challenge_count)
    assert_response :success
  end

  test "should update participant_challenge_count" do
    patch participant_challenge_count_url(@participant_challenge_count), params: { participant_challenge_count: { challenge_id: @participant_challenge_count.challenge_id, participant_id: @participant_challenge_count.participant_id, registration_type: @participant_challenge_count.registration_type, row_number: @participant_challenge_count.row_number } }
    assert_redirected_to participant_challenge_count_url(@participant_challenge_count)
  end

  test "should destroy participant_challenge_count" do
    assert_difference('ParticipantChallengeCount.count', -1) do
      delete participant_challenge_count_url(@participant_challenge_count)
    end

    assert_redirected_to participant_challenge_counts_url
  end
end
