require "application_system_test_case"

class TaskDatasetFilesTest < ApplicationSystemTestCase
  setup do
    @task_dataset_file = task_dataset_files(:one)
  end

  test "visiting the index" do
    visit task_dataset_files_url
    assert_selector "h1", text: "Task Dataset Files"
  end

  test "creating a Task dataset file" do
    visit task_dataset_files_url
    click_on "New Task Dataset File"

    fill_in "Clef Task", with: @task_dataset_file.clef_task_id
    fill_in "Dataset File S3 Key", with: @task_dataset_file.dataset_file_s3_key
    fill_in "Description", with: @task_dataset_file.description
    fill_in "Evaluation", with: @task_dataset_file.evaluation
    fill_in "Seq", with: @task_dataset_file.seq
    fill_in "Title", with: @task_dataset_file.title
    click_on "Create Task dataset file"

    assert_text "Task dataset file was successfully created"
    click_on "Back"
  end

  test "updating a Task dataset file" do
    visit task_dataset_files_url
    click_on "Edit", match: :first

    fill_in "Clef Task", with: @task_dataset_file.clef_task_id
    fill_in "Dataset File S3 Key", with: @task_dataset_file.dataset_file_s3_key
    fill_in "Description", with: @task_dataset_file.description
    fill_in "Evaluation", with: @task_dataset_file.evaluation
    fill_in "Seq", with: @task_dataset_file.seq
    fill_in "Title", with: @task_dataset_file.title
    click_on "Update Task dataset file"

    assert_text "Task dataset file was successfully updated"
    click_on "Back"
  end

  test "destroying a Task dataset file" do
    visit task_dataset_files_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Task dataset file was successfully destroyed"
  end
end
