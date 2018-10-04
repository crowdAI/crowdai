require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  setup do
    @article = articles(:one)
  end

  test "visiting the index" do
    visit articles_url
    assert_selector "h1", text: "Articles"
  end

  test "creating a Article" do
    visit articles_url
    click_on "New Article"

    fill_in "Article", with: @article.article
    fill_in "Article Type Cd", with: @article.article_type_cd
    fill_in "Category", with: @article.category
    fill_in "Image File", with: @article.image_file
    fill_in "Notebook Url", with: @article.notebook_url
    fill_in "Participant", with: @article.participant_id
    fill_in "Published", with: @article.published
    fill_in "Slug", with: @article.slug
    fill_in "Summary", with: @article.summary
    fill_in "View Count", with: @article.view_count
    fill_in "Vote Count", with: @article.vote_count
    click_on "Create Article"

    assert_text "Article was successfully created"
    click_on "Back"
  end

  test "updating a Article" do
    visit articles_url
    click_on "Edit", match: :first

    fill_in "Article", with: @article.article
    fill_in "Article Type Cd", with: @article.article_type_cd
    fill_in "Category", with: @article.category
    fill_in "Image File", with: @article.image_file
    fill_in "Notebook Url", with: @article.notebook_url
    fill_in "Participant", with: @article.participant_id
    fill_in "Published", with: @article.published
    fill_in "Slug", with: @article.slug
    fill_in "Summary", with: @article.summary
    fill_in "View Count", with: @article.view_count
    fill_in "Vote Count", with: @article.vote_count
    click_on "Update Article"

    assert_text "Article was successfully updated"
    click_on "Back"
  end

  test "destroying a Article" do
    visit articles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Article was successfully destroyed"
  end
end
