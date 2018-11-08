require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:one)
  end

  test "should get index" do
    get comments_url
    assert_response :success
  end

  test "should get new" do
    get new_comment_url
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post comments_url, params: { comment: { comment: @comment.comment, comment_markdown: @comment.comment_markdown, flagged: @comment.flagged, mentions_cache: @comment.mentions_cache, notify: @comment.notify, participant_id: @comment.participant_id, slug: @comment.slug, topic_id: @comment.topic_id, vote_count: @comment.vote_count } }
    end

    assert_redirected_to comment_url(Comment.last)
  end

  test "should show comment" do
    get comment_url(@comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_comment_url(@comment)
    assert_response :success
  end

  test "should update comment" do
    patch comment_url(@comment), params: { comment: { comment: @comment.comment, comment_markdown: @comment.comment_markdown, flagged: @comment.flagged, mentions_cache: @comment.mentions_cache, notify: @comment.notify, participant_id: @comment.participant_id, slug: @comment.slug, topic_id: @comment.topic_id, vote_count: @comment.vote_count } }
    assert_redirected_to comment_url(@comment)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete comment_url(@comment)
    end

    assert_redirected_to comments_url
  end
end
