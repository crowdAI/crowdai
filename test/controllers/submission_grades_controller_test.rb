require 'test_helper'

class SubmissionGradesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @submission_grade = submission_grades(:one)
  end

  test "should get index" do
    get submission_grades_url
    assert_response :success
  end

  test "should get new" do
    get new_submission_grade_url
    assert_response :success
  end

  test "should create submission_grade" do
    assert_difference('SubmissionGrade.count') do
      post submission_grades_url, params: { submission_grade: { grading_factor: @submission_grade.grading_factor, grading_message: @submission_grade.grading_message, grading_status_cd: @submission_grade.grading_status_cd, score: @submission_grade.score, score_secondary: @submission_grade.score_secondary, slug: @submission_grade.slug, submission_id: @submission_grade.submission_id } }
    end

    assert_redirected_to submission_grade_url(SubmissionGrade.last)
  end

  test "should show submission_grade" do
    get submission_grade_url(@submission_grade)
    assert_response :success
  end

  test "should get edit" do
    get edit_submission_grade_url(@submission_grade)
    assert_response :success
  end

  test "should update submission_grade" do
    patch submission_grade_url(@submission_grade), params: { submission_grade: { grading_factor: @submission_grade.grading_factor, grading_message: @submission_grade.grading_message, grading_status_cd: @submission_grade.grading_status_cd, score: @submission_grade.score, score_secondary: @submission_grade.score_secondary, slug: @submission_grade.slug, submission_id: @submission_grade.submission_id } }
    assert_redirected_to submission_grade_url(@submission_grade)
  end

  test "should destroy submission_grade" do
    assert_difference('SubmissionGrade.count', -1) do
      delete submission_grade_url(@submission_grade)
    end

    assert_redirected_to submission_grades_url
  end
end
