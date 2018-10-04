require 'test_helper'

class TopicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @topic = topics(:one)
  end

  test "should get index" do
    get topics_url
    assert_response :success
  end

  test "should get new" do
    get new_topic_url
    assert_response :success
  end

  test "should create topic" do
    assert_difference('Topic.count') do
      post topics_url, params: { topic: { challenge_id: @topic.challenge_id, participant_id: @topic.participant_id, posts_count: @topic.posts_count, slug: @topic.slug, sticky: @topic.sticky, topic: @topic.topic, views: @topic.views, vote_count: @topic.vote_count } }
    end

    assert_redirected_to topic_url(Topic.last)
  end

  test "should show topic" do
    get topic_url(@topic)
    assert_response :success
  end

  test "should get edit" do
    get edit_topic_url(@topic)
    assert_response :success
  end

  test "should update topic" do
    patch topic_url(@topic), params: { topic: { challenge_id: @topic.challenge_id, participant_id: @topic.participant_id, posts_count: @topic.posts_count, slug: @topic.slug, sticky: @topic.sticky, topic: @topic.topic, views: @topic.views, vote_count: @topic.vote_count } }
    assert_redirected_to topic_url(@topic)
  end

  test "should destroy topic" do
    assert_difference('Topic.count', -1) do
      delete topic_url(@topic)
    end

    assert_redirected_to topics_url
  end
end
