require "application_system_test_case"

class DatasetFilesTest < ApplicationSystemTestCase
  setup do
    @dataset_file = dataset_files(:one)
  end

  test "visiting the index" do
    visit dataset_files_url
    assert_selector "h1", text: "Dataset Files"
  end

  test "creating a Dataset file" do
    visit dataset_files_url
    click_on "New Dataset File"

    fill_in "Challenge", with: @dataset_file.challenge_id
    fill_in "Dataset File S3 Key", with: @dataset_file.dataset_file_s3_key
    fill_in "Description", with: @dataset_file.description
    fill_in "Evaluation", with: @dataset_file.evaluation
    fill_in "External File Size", with: @dataset_file.external_file_size
    fill_in "External Url", with: @dataset_file.external_url
    fill_in "Hosting Location", with: @dataset_file.hosting_location
    fill_in "Seq", with: @dataset_file.seq
    fill_in "Title", with: @dataset_file.title
    fill_in "Visible", with: @dataset_file.visible
    click_on "Create Dataset file"

    assert_text "Dataset file was successfully created"
    click_on "Back"
  end

  test "updating a Dataset file" do
    visit dataset_files_url
    click_on "Edit", match: :first

    fill_in "Challenge", with: @dataset_file.challenge_id
    fill_in "Dataset File S3 Key", with: @dataset_file.dataset_file_s3_key
    fill_in "Description", with: @dataset_file.description
    fill_in "Evaluation", with: @dataset_file.evaluation
    fill_in "External File Size", with: @dataset_file.external_file_size
    fill_in "External Url", with: @dataset_file.external_url
    fill_in "Hosting Location", with: @dataset_file.hosting_location
    fill_in "Seq", with: @dataset_file.seq
    fill_in "Title", with: @dataset_file.title
    fill_in "Visible", with: @dataset_file.visible
    click_on "Update Dataset file"

    assert_text "Dataset file was successfully updated"
    click_on "Back"
  end

  test "destroying a Dataset file" do
    visit dataset_files_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dataset file was successfully destroyed"
  end
end
