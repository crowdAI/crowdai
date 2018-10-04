require "application_system_test_case"

class DatasetFileDownloadsTest < ApplicationSystemTestCase
  setup do
    @dataset_file_download = dataset_file_downloads(:one)
  end

  test "visiting the index" do
    visit dataset_file_downloads_url
    assert_selector "h1", text: "Dataset File Downloads"
  end

  test "creating a Dataset file download" do
    visit dataset_file_downloads_url
    click_on "New Dataset File Download"

    fill_in "Dataset File", with: @dataset_file_download.dataset_file_id
    fill_in "Ip Address", with: @dataset_file_download.ip_address
    fill_in "Participant", with: @dataset_file_download.participant_id
    click_on "Create Dataset file download"

    assert_text "Dataset file download was successfully created"
    click_on "Back"
  end

  test "updating a Dataset file download" do
    visit dataset_file_downloads_url
    click_on "Edit", match: :first

    fill_in "Dataset File", with: @dataset_file_download.dataset_file_id
    fill_in "Ip Address", with: @dataset_file_download.ip_address
    fill_in "Participant", with: @dataset_file_download.participant_id
    click_on "Update Dataset file download"

    assert_text "Dataset file download was successfully updated"
    click_on "Back"
  end

  test "destroying a Dataset file download" do
    visit dataset_file_downloads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dataset file download was successfully destroyed"
  end
end
