require "application_system_test_case"

class SubmissionFilesTest < ApplicationSystemTestCase
  setup do
    @submission_file = submission_files(:one)
  end

  test "visiting the index" do
    visit submission_files_url
    assert_selector "h1", text: "Submission Files"
  end

  test "creating a Submission file" do
    visit submission_files_url
    click_on "New Submission File"

    fill_in "Leaderboard Video", with: @submission_file.leaderboard_video
    fill_in "Seq", with: @submission_file.seq
    fill_in "Submission File S3 Key", with: @submission_file.submission_file_s3_key
    fill_in "Submission", with: @submission_file.submission_id
    click_on "Create Submission file"

    assert_text "Submission file was successfully created"
    click_on "Back"
  end

  test "updating a Submission file" do
    visit submission_files_url
    click_on "Edit", match: :first

    fill_in "Leaderboard Video", with: @submission_file.leaderboard_video
    fill_in "Seq", with: @submission_file.seq
    fill_in "Submission File S3 Key", with: @submission_file.submission_file_s3_key
    fill_in "Submission", with: @submission_file.submission_id
    click_on "Update Submission file"

    assert_text "Submission file was successfully updated"
    click_on "Back"
  end

  test "destroying a Submission file" do
    visit submission_files_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Submission file was successfully destroyed"
  end
end
