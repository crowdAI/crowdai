require 'test_helper'

class TaskDatasetFileDownloadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_dataset_file_download = task_dataset_file_downloads(:one)
  end

  test "should get index" do
    get task_dataset_file_downloads_url
    assert_response :success
  end

  test "should get new" do
    get new_task_dataset_file_download_url
    assert_response :success
  end

  test "should create task_dataset_file_download" do
    assert_difference('TaskDatasetFileDownload.count') do
      post task_dataset_file_downloads_url, params: { task_dataset_file_download: { ip_address: @task_dataset_file_download.ip_address, participant_id: @task_dataset_file_download.participant_id, task_dataset_file_id: @task_dataset_file_download.task_dataset_file_id } }
    end

    assert_redirected_to task_dataset_file_download_url(TaskDatasetFileDownload.last)
  end

  test "should show task_dataset_file_download" do
    get task_dataset_file_download_url(@task_dataset_file_download)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_dataset_file_download_url(@task_dataset_file_download)
    assert_response :success
  end

  test "should update task_dataset_file_download" do
    patch task_dataset_file_download_url(@task_dataset_file_download), params: { task_dataset_file_download: { ip_address: @task_dataset_file_download.ip_address, participant_id: @task_dataset_file_download.participant_id, task_dataset_file_id: @task_dataset_file_download.task_dataset_file_id } }
    assert_redirected_to task_dataset_file_download_url(@task_dataset_file_download)
  end

  test "should destroy task_dataset_file_download" do
    assert_difference('TaskDatasetFileDownload.count', -1) do
      delete task_dataset_file_download_url(@task_dataset_file_download)
    end

    assert_redirected_to task_dataset_file_downloads_url
  end
end
