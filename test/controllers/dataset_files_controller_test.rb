require 'test_helper'

class DatasetFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dataset_file = dataset_files(:one)
  end

  test "should get index" do
    get dataset_files_url
    assert_response :success
  end

  test "should get new" do
    get new_dataset_file_url
    assert_response :success
  end

  test "should create dataset_file" do
    assert_difference('DatasetFile.count') do
      post dataset_files_url, params: { dataset_file: { challenge_id: @dataset_file.challenge_id, dataset_file_s3_key: @dataset_file.dataset_file_s3_key, description: @dataset_file.description, evaluation: @dataset_file.evaluation, external_file_size: @dataset_file.external_file_size, external_url: @dataset_file.external_url, hosting_location: @dataset_file.hosting_location, seq: @dataset_file.seq, title: @dataset_file.title, visible: @dataset_file.visible } }
    end

    assert_redirected_to dataset_file_url(DatasetFile.last)
  end

  test "should show dataset_file" do
    get dataset_file_url(@dataset_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_dataset_file_url(@dataset_file)
    assert_response :success
  end

  test "should update dataset_file" do
    patch dataset_file_url(@dataset_file), params: { dataset_file: { challenge_id: @dataset_file.challenge_id, dataset_file_s3_key: @dataset_file.dataset_file_s3_key, description: @dataset_file.description, evaluation: @dataset_file.evaluation, external_file_size: @dataset_file.external_file_size, external_url: @dataset_file.external_url, hosting_location: @dataset_file.hosting_location, seq: @dataset_file.seq, title: @dataset_file.title, visible: @dataset_file.visible } }
    assert_redirected_to dataset_file_url(@dataset_file)
  end

  test "should destroy dataset_file" do
    assert_difference('DatasetFile.count', -1) do
      delete dataset_file_url(@dataset_file)
    end

    assert_redirected_to dataset_files_url
  end
end
