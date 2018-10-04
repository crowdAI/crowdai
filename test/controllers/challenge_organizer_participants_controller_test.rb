require 'test_helper'

class ChallengeOrganizerParticipantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @challenge_organizer_participant = challenge_organizer_participants(:one)
  end

  test "should get index" do
    get challenge_organizer_participants_url
    assert_response :success
  end

  test "should get new" do
    get new_challenge_organizer_participant_url
    assert_response :success
  end

  test "should create challenge_organizer_participant" do
    assert_difference('ChallengeOrganizerParticipant.count') do
      post challenge_organizer_participants_url, params: { challenge_organizer_participant: { challenge: @challenge_organizer_participant.challenge, clef_task_id: @challenge_organizer_participant.clef_task_id, name: @challenge_organizer_participant.name, organizer_id: @challenge_organizer_participant.organizer_id, participant_id: @challenge_organizer_participant.participant_id } }
    end

    assert_redirected_to challenge_organizer_participant_url(ChallengeOrganizerParticipant.last)
  end

  test "should show challenge_organizer_participant" do
    get challenge_organizer_participant_url(@challenge_organizer_participant)
    assert_response :success
  end

  test "should get edit" do
    get edit_challenge_organizer_participant_url(@challenge_organizer_participant)
    assert_response :success
  end

  test "should update challenge_organizer_participant" do
    patch challenge_organizer_participant_url(@challenge_organizer_participant), params: { challenge_organizer_participant: { challenge: @challenge_organizer_participant.challenge, clef_task_id: @challenge_organizer_participant.clef_task_id, name: @challenge_organizer_participant.name, organizer_id: @challenge_organizer_participant.organizer_id, participant_id: @challenge_organizer_participant.participant_id } }
    assert_redirected_to challenge_organizer_participant_url(@challenge_organizer_participant)
  end

  test "should destroy challenge_organizer_participant" do
    assert_difference('ChallengeOrganizerParticipant.count', -1) do
      delete challenge_organizer_participant_url(@challenge_organizer_participant)
    end

    assert_redirected_to challenge_organizer_participants_url
  end
end
