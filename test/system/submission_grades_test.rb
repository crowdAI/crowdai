require "application_system_test_case"

class SubmissionGradesTest < ApplicationSystemTestCase
  setup do
    @submission_grade = submission_grades(:one)
  end

  test "visiting the index" do
    visit submission_grades_url
    assert_selector "h1", text: "Submission Grades"
  end

  test "creating a Submission grade" do
    visit submission_grades_url
    click_on "New Submission Grade"

    fill_in "Grading Factor", with: @submission_grade.grading_factor
    fill_in "Grading Message", with: @submission_grade.grading_message
    fill_in "Grading Status Cd", with: @submission_grade.grading_status_cd
    fill_in "Score", with: @submission_grade.score
    fill_in "Score Secondary", with: @submission_grade.score_secondary
    fill_in "Slug", with: @submission_grade.slug
    fill_in "Submission", with: @submission_grade.submission_id
    click_on "Create Submission grade"

    assert_text "Submission grade was successfully created"
    click_on "Back"
  end

  test "updating a Submission grade" do
    visit submission_grades_url
    click_on "Edit", match: :first

    fill_in "Grading Factor", with: @submission_grade.grading_factor
    fill_in "Grading Message", with: @submission_grade.grading_message
    fill_in "Grading Status Cd", with: @submission_grade.grading_status_cd
    fill_in "Score", with: @submission_grade.score
    fill_in "Score Secondary", with: @submission_grade.score_secondary
    fill_in "Slug", with: @submission_grade.slug
    fill_in "Submission", with: @submission_grade.submission_id
    click_on "Update Submission grade"

    assert_text "Submission grade was successfully updated"
    click_on "Back"
  end

  test "destroying a Submission grade" do
    visit submission_grades_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Submission grade was successfully destroyed"
  end
end
