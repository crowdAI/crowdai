require 'test_helper'

class ParticipantSubmissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @participant_submission = participant_submissions(:one)
  end

  test "should get index" do
    get participant_submissions_url
    assert_response :success
  end

  test "should get new" do
    get new_participant_submission_url
    assert_response :success
  end

  test "should create participant_submission" do
    assert_difference('ParticipantSubmission.count') do
      post participant_submissions_url, params: { participant_submission: { challenge_id: @participant_submission.challenge_id, files: @participant_submission.files, grading_status_cd: @participant_submission.grading_status_cd, name: @participant_submission.name, participant_id: @participant_submission.participant_id, post_challenge: @participant_submission.post_challenge, score: @participant_submission.score, score_secondary: @participant_submission.score_secondary } }
    end

    assert_redirected_to participant_submission_url(ParticipantSubmission.last)
  end

  test "should show participant_submission" do
    get participant_submission_url(@participant_submission)
    assert_response :success
  end

  test "should get edit" do
    get edit_participant_submission_url(@participant_submission)
    assert_response :success
  end

  test "should update participant_submission" do
    patch participant_submission_url(@participant_submission), params: { participant_submission: { challenge_id: @participant_submission.challenge_id, files: @participant_submission.files, grading_status_cd: @participant_submission.grading_status_cd, name: @participant_submission.name, participant_id: @participant_submission.participant_id, post_challenge: @participant_submission.post_challenge, score: @participant_submission.score, score_secondary: @participant_submission.score_secondary } }
    assert_redirected_to participant_submission_url(@participant_submission)
  end

  test "should destroy participant_submission" do
    assert_difference('ParticipantSubmission.count', -1) do
      delete participant_submission_url(@participant_submission)
    end

    assert_redirected_to participant_submissions_url
  end
end
