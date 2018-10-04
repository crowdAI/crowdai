require 'test_helper'

class SubmissionCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @submission_comment = submission_comments(:one)
  end

  test "should get index" do
    get submission_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_submission_comment_url
    assert_response :success
  end

  test "should create submission_comment" do
    assert_difference('SubmissionComment.count') do
      post submission_comments_url, params: { submission_comment: { comment: @submission_comment.comment, comment_markdown: @submission_comment.comment_markdown, participant_id: @submission_comment.participant_id, submission_id: @submission_comment.submission_id, vote_count: @submission_comment.vote_count } }
    end

    assert_redirected_to submission_comment_url(SubmissionComment.last)
  end

  test "should show submission_comment" do
    get submission_comment_url(@submission_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_submission_comment_url(@submission_comment)
    assert_response :success
  end

  test "should update submission_comment" do
    patch submission_comment_url(@submission_comment), params: { submission_comment: { comment: @submission_comment.comment, comment_markdown: @submission_comment.comment_markdown, participant_id: @submission_comment.participant_id, submission_id: @submission_comment.submission_id, vote_count: @submission_comment.vote_count } }
    assert_redirected_to submission_comment_url(@submission_comment)
  end

  test "should destroy submission_comment" do
    assert_difference('SubmissionComment.count', -1) do
      delete submission_comment_url(@submission_comment)
    end

    assert_redirected_to submission_comments_url
  end
end
