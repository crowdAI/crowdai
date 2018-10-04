require 'test_helper'

class SubmissionFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @submission_file = submission_files(:one)
  end

  test "should get index" do
    get submission_files_url
    assert_response :success
  end

  test "should get new" do
    get new_submission_file_url
    assert_response :success
  end

  test "should create submission_file" do
    assert_difference('SubmissionFile.count') do
      post submission_files_url, params: { submission_file: { leaderboard_video: @submission_file.leaderboard_video, seq: @submission_file.seq, submission_file_s3_key: @submission_file.submission_file_s3_key, submission_id: @submission_file.submission_id } }
    end

    assert_redirected_to submission_file_url(SubmissionFile.last)
  end

  test "should show submission_file" do
    get submission_file_url(@submission_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_submission_file_url(@submission_file)
    assert_response :success
  end

  test "should update submission_file" do
    patch submission_file_url(@submission_file), params: { submission_file: { leaderboard_video: @submission_file.leaderboard_video, seq: @submission_file.seq, submission_file_s3_key: @submission_file.submission_file_s3_key, submission_id: @submission_file.submission_id } }
    assert_redirected_to submission_file_url(@submission_file)
  end

  test "should destroy submission_file" do
    assert_difference('SubmissionFile.count', -1) do
      delete submission_file_url(@submission_file)
    end

    assert_redirected_to submission_files_url
  end
end
