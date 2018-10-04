require 'test_helper'

class ParticipantClefTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @participant_clef_task = participant_clef_tasks(:one)
  end

  test "should get index" do
    get participant_clef_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_participant_clef_task_url
    assert_response :success
  end

  test "should create participant_clef_task" do
    assert_difference('ParticipantClefTask.count') do
      post participant_clef_tasks_url, params: { participant_clef_task: { approved: @participant_clef_task.approved, clef_task_id: @participant_clef_task.clef_task_id, eua_file: @participant_clef_task.eua_file, participant_id: @participant_clef_task.participant_id, status_cd: @participant_clef_task.status_cd } }
    end

    assert_redirected_to participant_clef_task_url(ParticipantClefTask.last)
  end

  test "should show participant_clef_task" do
    get participant_clef_task_url(@participant_clef_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_participant_clef_task_url(@participant_clef_task)
    assert_response :success
  end

  test "should update participant_clef_task" do
    patch participant_clef_task_url(@participant_clef_task), params: { participant_clef_task: { approved: @participant_clef_task.approved, clef_task_id: @participant_clef_task.clef_task_id, eua_file: @participant_clef_task.eua_file, participant_id: @participant_clef_task.participant_id, status_cd: @participant_clef_task.status_cd } }
    assert_redirected_to participant_clef_task_url(@participant_clef_task)
  end

  test "should destroy participant_clef_task" do
    assert_difference('ParticipantClefTask.count', -1) do
      delete participant_clef_task_url(@participant_clef_task)
    end

    assert_redirected_to participant_clef_tasks_url
  end
end
