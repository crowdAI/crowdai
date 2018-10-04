require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase
  setup do
    @comment = comments(:one)
  end

  test "visiting the index" do
    visit comments_url
    assert_selector "h1", text: "Comments"
  end

  test "creating a Comment" do
    visit comments_url
    click_on "New Comment"

    fill_in "Comment", with: @comment.comment
    fill_in "Comment Markdown", with: @comment.comment_markdown
    fill_in "Flagged", with: @comment.flagged
    fill_in "Mentions Cache", with: @comment.mentions_cache
    fill_in "Notify", with: @comment.notify
    fill_in "Participant", with: @comment.participant_id
    fill_in "Slug", with: @comment.slug
    fill_in "Topic", with: @comment.topic_id
    fill_in "Vote Count", with: @comment.vote_count
    click_on "Create Comment"

    assert_text "Comment was successfully created"
    click_on "Back"
  end

  test "updating a Comment" do
    visit comments_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @comment.comment
    fill_in "Comment Markdown", with: @comment.comment_markdown
    fill_in "Flagged", with: @comment.flagged
    fill_in "Mentions Cache", with: @comment.mentions_cache
    fill_in "Notify", with: @comment.notify
    fill_in "Participant", with: @comment.participant_id
    fill_in "Slug", with: @comment.slug
    fill_in "Topic", with: @comment.topic_id
    fill_in "Vote Count", with: @comment.vote_count
    click_on "Update Comment"

    assert_text "Comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Comment" do
    visit comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Comment was successfully destroyed"
  end
end
