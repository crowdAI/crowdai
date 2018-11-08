require 'test_helper'

class FollowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @follow = follows(:one)
  end

  test "should get index" do
    get follows_url
    assert_response :success
  end

  test "should get new" do
    get new_follow_url
    assert_response :success
  end

  test "should create follow" do
    assert_difference('Follow.count') do
      post follows_url, params: { follow: { followable_id: @follow.followable_id, followable_type: @follow.followable_type, participant_id: @follow.participant_id } }
    end

    assert_redirected_to follow_url(Follow.last)
  end

  test "should show follow" do
    get follow_url(@follow)
    assert_response :success
  end

  test "should get edit" do
    get edit_follow_url(@follow)
    assert_response :success
  end

  test "should update follow" do
    patch follow_url(@follow), params: { follow: { followable_id: @follow.followable_id, followable_type: @follow.followable_type, participant_id: @follow.participant_id } }
    assert_redirected_to follow_url(@follow)
  end

  test "should destroy follow" do
    assert_difference('Follow.count', -1) do
      delete follow_url(@follow)
    end

    assert_redirected_to follows_url
  end
end
