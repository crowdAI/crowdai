require 'test_helper'

class ApplicationRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @application_record = application_records(:one)
  end

  test "should get index" do
    get application_records_url
    assert_response :success
  end

  test "should get new" do
    get new_application_record_url
    assert_response :success
  end

  test "should create application_record" do
    assert_difference('ApplicationRecord.count') do
      post application_records_url, params: { application_record: {  } }
    end

    assert_redirected_to application_record_url(ApplicationRecord.last)
  end

  test "should show application_record" do
    get application_record_url(@application_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_application_record_url(@application_record)
    assert_response :success
  end

  test "should update application_record" do
    patch application_record_url(@application_record), params: { application_record: {  } }
    assert_redirected_to application_record_url(@application_record)
  end

  test "should destroy application_record" do
    assert_difference('ApplicationRecord.count', -1) do
      delete application_record_url(@application_record)
    end

    assert_redirected_to application_records_url
  end
end
