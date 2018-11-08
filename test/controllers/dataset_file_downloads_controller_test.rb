require 'test_helper'

class DatasetFileDownloadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dataset_file_download = dataset_file_downloads(:one)
  end

  test "should get index" do
    get dataset_file_downloads_url
    assert_response :success
  end

  test "should get new" do
    get new_dataset_file_download_url
    assert_response :success
  end

  test "should create dataset_file_download" do
    assert_difference('DatasetFileDownload.count') do
      post dataset_file_downloads_url, params: { dataset_file_download: { dataset_file_id: @dataset_file_download.dataset_file_id, ip_address: @dataset_file_download.ip_address, participant_id: @dataset_file_download.participant_id } }
    end

    assert_redirected_to dataset_file_download_url(DatasetFileDownload.last)
  end

  test "should show dataset_file_download" do
    get dataset_file_download_url(@dataset_file_download)
    assert_response :success
  end

  test "should get edit" do
    get edit_dataset_file_download_url(@dataset_file_download)
    assert_response :success
  end

  test "should update dataset_file_download" do
    patch dataset_file_download_url(@dataset_file_download), params: { dataset_file_download: { dataset_file_id: @dataset_file_download.dataset_file_id, ip_address: @dataset_file_download.ip_address, participant_id: @dataset_file_download.participant_id } }
    assert_redirected_to dataset_file_download_url(@dataset_file_download)
  end

  test "should destroy dataset_file_download" do
    assert_difference('DatasetFileDownload.count', -1) do
      delete dataset_file_download_url(@dataset_file_download)
    end

    assert_redirected_to dataset_file_downloads_url
  end
end
