require 'test_helper'

class SubmissionFileDefinitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @submission_file_definition = submission_file_definitions(:one)
  end

  test "should get index" do
    get submission_file_definitions_url
    assert_response :success
  end

  test "should get new" do
    get new_submission_file_definition_url
    assert_response :success
  end

  test "should create submission_file_definition" do
    assert_difference('SubmissionFileDefinition.count') do
      post submission_file_definitions_url, params: { submission_file_definition: { challenge_id: @submission_file_definition.challenge_id, file_required: @submission_file_definition.file_required, filetype_cd: @submission_file_definition.filetype_cd, seq: @submission_file_definition.seq, submission_file_description: @submission_file_definition.submission_file_description, submission_file_help_text: @submission_file_definition.submission_file_help_text } }
    end

    assert_redirected_to submission_file_definition_url(SubmissionFileDefinition.last)
  end

  test "should show submission_file_definition" do
    get submission_file_definition_url(@submission_file_definition)
    assert_response :success
  end

  test "should get edit" do
    get edit_submission_file_definition_url(@submission_file_definition)
    assert_response :success
  end

  test "should update submission_file_definition" do
    patch submission_file_definition_url(@submission_file_definition), params: { submission_file_definition: { challenge_id: @submission_file_definition.challenge_id, file_required: @submission_file_definition.file_required, filetype_cd: @submission_file_definition.filetype_cd, seq: @submission_file_definition.seq, submission_file_description: @submission_file_definition.submission_file_description, submission_file_help_text: @submission_file_definition.submission_file_help_text } }
    assert_redirected_to submission_file_definition_url(@submission_file_definition)
  end

  test "should destroy submission_file_definition" do
    assert_difference('SubmissionFileDefinition.count', -1) do
      delete submission_file_definition_url(@submission_file_definition)
    end

    assert_redirected_to submission_file_definitions_url
  end
end
