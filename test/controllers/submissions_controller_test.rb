require 'test_helper'

class SubmissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @submission = submissions(:one)
  end

  test "should get index" do
    get submissions_url
    assert_response :success
  end

  test "should get new" do
    get new_submission_url
    assert_response :success
  end

  test "should create submission" do
    assert_difference('Submission.count') do
      post submissions_url, params: { submission: { api: @submission.api, baseline: @submission.baseline, baseline_comment: @submission.baseline_comment, challenge_id: @submission.challenge_id, challenge_round_id: @submission.challenge_round_id, clef_additional: @submission.clef_additional, clef_method_description: @submission.clef_method_description, clef_other_info: @submission.clef_other_info, clef_primary_run: @submission.clef_primary_run, clef_retrieval_type: @submission.clef_retrieval_type, clef_run_type: @submission.clef_run_type, description: @submission.description, description_markdown: @submission.description_markdown, grading_message: @submission.grading_message, grading_status_cd: @submission.grading_status_cd, media_content_type: @submission.media_content_type, media_large: @submission.media_large, media_thumbnail: @submission.media_thumbnail, meta: @submission.meta, online_submission: @submission.online_submission, participant_id: @submission.participant_id, post_challenge: @submission.post_challenge, score: @submission.score, score_display: @submission.score_display, score_secondary: @submission.score_secondary, score_secondary_display: @submission.score_secondary_display, short_url: @submission.short_url, vote_count: @submission.vote_count } }
    end

    assert_redirected_to submission_url(Submission.last)
  end

  test "should show submission" do
    get submission_url(@submission)
    assert_response :success
  end

  test "should get edit" do
    get edit_submission_url(@submission)
    assert_response :success
  end

  test "should update submission" do
    patch submission_url(@submission), params: { submission: { api: @submission.api, baseline: @submission.baseline, baseline_comment: @submission.baseline_comment, challenge_id: @submission.challenge_id, challenge_round_id: @submission.challenge_round_id, clef_additional: @submission.clef_additional, clef_method_description: @submission.clef_method_description, clef_other_info: @submission.clef_other_info, clef_primary_run: @submission.clef_primary_run, clef_retrieval_type: @submission.clef_retrieval_type, clef_run_type: @submission.clef_run_type, description: @submission.description, description_markdown: @submission.description_markdown, grading_message: @submission.grading_message, grading_status_cd: @submission.grading_status_cd, media_content_type: @submission.media_content_type, media_large: @submission.media_large, media_thumbnail: @submission.media_thumbnail, meta: @submission.meta, online_submission: @submission.online_submission, participant_id: @submission.participant_id, post_challenge: @submission.post_challenge, score: @submission.score, score_display: @submission.score_display, score_secondary: @submission.score_secondary, score_secondary_display: @submission.score_secondary_display, short_url: @submission.short_url, vote_count: @submission.vote_count } }
    assert_redirected_to submission_url(@submission)
  end

  test "should destroy submission" do
    assert_difference('Submission.count', -1) do
      delete submission_url(@submission)
    end

    assert_redirected_to submissions_url
  end
end
