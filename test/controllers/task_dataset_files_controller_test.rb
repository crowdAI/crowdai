require 'test_helper'

class TaskDatasetFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_dataset_file = task_dataset_files(:one)
  end

  test "should get index" do
    get task_dataset_files_url
    assert_response :success
  end

  test "should get new" do
    get new_task_dataset_file_url
    assert_response :success
  end

  test "should create task_dataset_file" do
    assert_difference('TaskDatasetFile.count') do
      post task_dataset_files_url, params: { task_dataset_file: { clef_task_id: @task_dataset_file.clef_task_id, dataset_file_s3_key: @task_dataset_file.dataset_file_s3_key, description: @task_dataset_file.description, evaluation: @task_dataset_file.evaluation, seq: @task_dataset_file.seq, title: @task_dataset_file.title } }
    end

    assert_redirected_to task_dataset_file_url(TaskDatasetFile.last)
  end

  test "should show task_dataset_file" do
    get task_dataset_file_url(@task_dataset_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_dataset_file_url(@task_dataset_file)
    assert_response :success
  end

  test "should update task_dataset_file" do
    patch task_dataset_file_url(@task_dataset_file), params: { task_dataset_file: { clef_task_id: @task_dataset_file.clef_task_id, dataset_file_s3_key: @task_dataset_file.dataset_file_s3_key, description: @task_dataset_file.description, evaluation: @task_dataset_file.evaluation, seq: @task_dataset_file.seq, title: @task_dataset_file.title } }
    assert_redirected_to task_dataset_file_url(@task_dataset_file)
  end

  test "should destroy task_dataset_file" do
    assert_difference('TaskDatasetFile.count', -1) do
      delete task_dataset_file_url(@task_dataset_file)
    end

    assert_redirected_to task_dataset_files_url
  end
end
