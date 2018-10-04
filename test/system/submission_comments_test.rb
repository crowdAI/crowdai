require "application_system_test_case"

class SubmissionCommentsTest < ApplicationSystemTestCase
  setup do
    @submission_comment = submission_comments(:one)
  end

  test "visiting the index" do
    visit submission_comments_url
    assert_selector "h1", text: "Submission Comments"
  end

  test "creating a Submission comment" do
    visit submission_comments_url
    click_on "New Submission Comment"

    fill_in "Comment", with: @submission_comment.comment
    fill_in "Comment Markdown", with: @submission_comment.comment_markdown
    fill_in "Participant", with: @submission_comment.participant_id
    fill_in "Submission", with: @submission_comment.submission_id
    fill_in "Vote Count", with: @submission_comment.vote_count
    click_on "Create Submission comment"

    assert_text "Submission comment was successfully created"
    click_on "Back"
  end

  test "updating a Submission comment" do
    visit submission_comments_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @submission_comment.comment
    fill_in "Comment Markdown", with: @submission_comment.comment_markdown
    fill_in "Participant", with: @submission_comment.participant_id
    fill_in "Submission", with: @submission_comment.submission_id
    fill_in "Vote Count", with: @submission_comment.vote_count
    click_on "Update Submission comment"

    assert_text "Submission comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Submission comment" do
    visit submission_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Submission comment was successfully destroyed"
  end
end
