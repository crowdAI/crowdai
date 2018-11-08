require 'test_helper'

class MaterializedViewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @materialized_view = materialized_views(:one)
  end

  test "should get index" do
    get materialized_views_url
    assert_response :success
  end

  test "should get new" do
    get new_materialized_view_url
    assert_response :success
  end

  test "should create materialized_view" do
    assert_difference('MaterializedView.count') do
      post materialized_views_url, params: { materialized_view: {  } }
    end

    assert_redirected_to materialized_view_url(MaterializedView.last)
  end

  test "should show materialized_view" do
    get materialized_view_url(@materialized_view)
    assert_response :success
  end

  test "should get edit" do
    get edit_materialized_view_url(@materialized_view)
    assert_response :success
  end

  test "should update materialized_view" do
    patch materialized_view_url(@materialized_view), params: { materialized_view: {  } }
    assert_redirected_to materialized_view_url(@materialized_view)
  end

  test "should destroy materialized_view" do
    assert_difference('MaterializedView.count', -1) do
      delete materialized_view_url(@materialized_view)
    end

    assert_redirected_to materialized_views_url
  end
end
