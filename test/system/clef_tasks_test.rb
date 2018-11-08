require "application_system_test_case"

class ClefTasksTest < ApplicationSystemTestCase
  setup do
    @clef_task = clef_tasks(:one)
  end

  test "visiting the index" do
    visit clef_tasks_url
    assert_selector "h1", text: "Clef Tasks"
  end

  test "creating a Clef task" do
    visit clef_tasks_url
    click_on "New Clef Task"

    fill_in "Eua File", with: @clef_task.eua_file
    fill_in "Organizer", with: @clef_task.organizer_id
    fill_in "Task", with: @clef_task.task
    click_on "Create Clef task"

    assert_text "Clef task was successfully created"
    click_on "Back"
  end

  test "updating a Clef task" do
    visit clef_tasks_url
    click_on "Edit", match: :first

    fill_in "Eua File", with: @clef_task.eua_file
    fill_in "Organizer", with: @clef_task.organizer_id
    fill_in "Task", with: @clef_task.task
    click_on "Update Clef task"

    assert_text "Clef task was successfully updated"
    click_on "Back"
  end

  test "destroying a Clef task" do
    visit clef_tasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Clef task was successfully destroyed"
  end
end
