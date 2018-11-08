require "application_system_test_case"

class TaskDatasetFileDownloadsTest < ApplicationSystemTestCase
  setup do
    @task_dataset_file_download = task_dataset_file_downloads(:one)
  end

  test "visiting the index" do
    visit task_dataset_file_downloads_url
    assert_selector "h1", text: "Task Dataset File Downloads"
  end

  test "creating a Task dataset file download" do
    visit task_dataset_file_downloads_url
    click_on "New Task Dataset File Download"

    fill_in "Ip Address", with: @task_dataset_file_download.ip_address
    fill_in "Participant", with: @task_dataset_file_download.participant_id
    fill_in "Task Dataset File", with: @task_dataset_file_download.task_dataset_file_id
    click_on "Create Task dataset file download"

    assert_text "Task dataset file download was successfully created"
    click_on "Back"
  end

  test "updating a Task dataset file download" do
    visit task_dataset_file_downloads_url
    click_on "Edit", match: :first

    fill_in "Ip Address", with: @task_dataset_file_download.ip_address
    fill_in "Participant", with: @task_dataset_file_download.participant_id
    fill_in "Task Dataset File", with: @task_dataset_file_download.task_dataset_file_id
    click_on "Update Task dataset file download"

    assert_text "Task dataset file download was successfully updated"
    click_on "Back"
  end

  test "destroying a Task dataset file download" do
    visit task_dataset_file_downloads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Task dataset file download was successfully destroyed"
  end
end
