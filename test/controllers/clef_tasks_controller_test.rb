require 'test_helper'

class ClefTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clef_task = clef_tasks(:one)
  end

  test "should get index" do
    get clef_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_clef_task_url
    assert_response :success
  end

  test "should create clef_task" do
    assert_difference('ClefTask.count') do
      post clef_tasks_url, params: { clef_task: { eua_file: @clef_task.eua_file, organizer_id: @clef_task.organizer_id, task: @clef_task.task } }
    end

    assert_redirected_to clef_task_url(ClefTask.last)
  end

  test "should show clef_task" do
    get clef_task_url(@clef_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_clef_task_url(@clef_task)
    assert_response :success
  end

  test "should update clef_task" do
    patch clef_task_url(@clef_task), params: { clef_task: { eua_file: @clef_task.eua_file, organizer_id: @clef_task.organizer_id, task: @clef_task.task } }
    assert_redirected_to clef_task_url(@clef_task)
  end

  test "should destroy clef_task" do
    assert_difference('ClefTask.count', -1) do
      delete clef_task_url(@clef_task)
    end

    assert_redirected_to clef_tasks_url
  end
end
