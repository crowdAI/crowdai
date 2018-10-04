require 'test_helper'

class BlogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blog = blogs(:one)
  end

  test "should get index" do
    get blogs_url
    assert_response :success
  end

  test "should get new" do
    get new_blog_url
    assert_response :success
  end

  test "should create blog" do
    assert_difference('Blog.count') do
      post blogs_url, params: { blog: { body: @blog.body, body_markdown: @blog.body_markdown, participant_id: @blog.participant_id, posted_at: @blog.posted_at, published: @blog.published, seq: @blog.seq, title: @blog.title, view_count: @blog.view_count, vote_count: @blog.vote_count } }
    end

    assert_redirected_to blog_url(Blog.last)
  end

  test "should show blog" do
    get blog_url(@blog)
    assert_response :success
  end

  test "should get edit" do
    get edit_blog_url(@blog)
    assert_response :success
  end

  test "should update blog" do
    patch blog_url(@blog), params: { blog: { body: @blog.body, body_markdown: @blog.body_markdown, participant_id: @blog.participant_id, posted_at: @blog.posted_at, published: @blog.published, seq: @blog.seq, title: @blog.title, view_count: @blog.view_count, vote_count: @blog.vote_count } }
    assert_redirected_to blog_url(@blog)
  end

  test "should destroy blog" do
    assert_difference('Blog.count', -1) do
      delete blog_url(@blog)
    end

    assert_redirected_to blogs_url
  end
end
