require "application_system_test_case"

class ParticipantClefTasksTest < ApplicationSystemTestCase
  setup do
    @participant_clef_task = participant_clef_tasks(:one)
  end

  test "visiting the index" do
    visit participant_clef_tasks_url
    assert_selector "h1", text: "Participant Clef Tasks"
  end

  test "creating a Participant clef task" do
    visit participant_clef_tasks_url
    click_on "New Participant Clef Task"

    fill_in "Approved", with: @participant_clef_task.approved
    fill_in "Clef Task", with: @participant_clef_task.clef_task_id
    fill_in "Eua File", with: @participant_clef_task.eua_file
    fill_in "Participant", with: @participant_clef_task.participant_id
    fill_in "Status Cd", with: @participant_clef_task.status_cd
    click_on "Create Participant clef task"

    assert_text "Participant clef task was successfully created"
    click_on "Back"
  end

  test "updating a Participant clef task" do
    visit participant_clef_tasks_url
    click_on "Edit", match: :first

    fill_in "Approved", with: @participant_clef_task.approved
    fill_in "Clef Task", with: @participant_clef_task.clef_task_id
    fill_in "Eua File", with: @participant_clef_task.eua_file
    fill_in "Participant", with: @participant_clef_task.participant_id
    fill_in "Status Cd", with: @participant_clef_task.status_cd
    click_on "Update Participant clef task"

    assert_text "Participant clef task was successfully updated"
    click_on "Back"
  end

  test "destroying a Participant clef task" do
    visit participant_clef_tasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Participant clef task was successfully destroyed"
  end
end
