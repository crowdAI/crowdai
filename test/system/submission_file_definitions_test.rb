require "application_system_test_case"

class SubmissionFileDefinitionsTest < ApplicationSystemTestCase
  setup do
    @submission_file_definition = submission_file_definitions(:one)
  end

  test "visiting the index" do
    visit submission_file_definitions_url
    assert_selector "h1", text: "Submission File Definitions"
  end

  test "creating a Submission file definition" do
    visit submission_file_definitions_url
    click_on "New Submission File Definition"

    fill_in "Challenge", with: @submission_file_definition.challenge_id
    fill_in "File Required", with: @submission_file_definition.file_required
    fill_in "Filetype Cd", with: @submission_file_definition.filetype_cd
    fill_in "Seq", with: @submission_file_definition.seq
    fill_in "Submission File Description", with: @submission_file_definition.submission_file_description
    fill_in "Submission File Help Text", with: @submission_file_definition.submission_file_help_text
    click_on "Create Submission file definition"

    assert_text "Submission file definition was successfully created"
    click_on "Back"
  end

  test "updating a Submission file definition" do
    visit submission_file_definitions_url
    click_on "Edit", match: :first

    fill_in "Challenge", with: @submission_file_definition.challenge_id
    fill_in "File Required", with: @submission_file_definition.file_required
    fill_in "Filetype Cd", with: @submission_file_definition.filetype_cd
    fill_in "Seq", with: @submission_file_definition.seq
    fill_in "Submission File Description", with: @submission_file_definition.submission_file_description
    fill_in "Submission File Help Text", with: @submission_file_definition.submission_file_help_text
    click_on "Update Submission file definition"

    assert_text "Submission file definition was successfully updated"
    click_on "Back"
  end

  test "destroying a Submission file definition" do
    visit submission_file_definitions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Submission file definition was successfully destroyed"
  end
end
