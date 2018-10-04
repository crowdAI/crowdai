require 'test_helper'

class SqlViewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sql_view = sql_views(:one)
  end

  test "should get index" do
    get sql_views_url
    assert_response :success
  end

  test "should get new" do
    get new_sql_view_url
    assert_response :success
  end

  test "should create sql_view" do
    assert_difference('SqlView.count') do
      post sql_views_url, params: { sql_view: {  } }
    end

    assert_redirected_to sql_view_url(SqlView.last)
  end

  test "should show sql_view" do
    get sql_view_url(@sql_view)
    assert_response :success
  end

  test "should get edit" do
    get edit_sql_view_url(@sql_view)
    assert_response :success
  end

  test "should update sql_view" do
    patch sql_view_url(@sql_view), params: { sql_view: {  } }
    assert_redirected_to sql_view_url(@sql_view)
  end

  test "should destroy sql_view" do
    assert_difference('SqlView.count', -1) do
      delete sql_view_url(@sql_view)
    end

    assert_redirected_to sql_views_url
  end
end
