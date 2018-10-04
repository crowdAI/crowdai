require "application_system_test_case"

class BlogsTest < ApplicationSystemTestCase
  setup do
    @blog = blogs(:one)
  end

  test "visiting the index" do
    visit blogs_url
    assert_selector "h1", text: "Blogs"
  end

  test "creating a Blog" do
    visit blogs_url
    click_on "New Blog"

    fill_in "Body", with: @blog.body
    fill_in "Body Markdown", with: @blog.body_markdown
    fill_in "Participant", with: @blog.participant_id
    fill_in "Posted At", with: @blog.posted_at
    fill_in "Published", with: @blog.published
    fill_in "Seq", with: @blog.seq
    fill_in "Title", with: @blog.title
    fill_in "View Count", with: @blog.view_count
    fill_in "Vote Count", with: @blog.vote_count
    click_on "Create Blog"

    assert_text "Blog was successfully created"
    click_on "Back"
  end

  test "updating a Blog" do
    visit blogs_url
    click_on "Edit", match: :first

    fill_in "Body", with: @blog.body
    fill_in "Body Markdown", with: @blog.body_markdown
    fill_in "Participant", with: @blog.participant_id
    fill_in "Posted At", with: @blog.posted_at
    fill_in "Published", with: @blog.published
    fill_in "Seq", with: @blog.seq
    fill_in "Title", with: @blog.title
    fill_in "View Count", with: @blog.view_count
    fill_in "Vote Count", with: @blog.vote_count
    click_on "Update Blog"

    assert_text "Blog was successfully updated"
    click_on "Back"
  end

  test "destroying a Blog" do
    visit blogs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Blog was successfully destroyed"
  end
end
