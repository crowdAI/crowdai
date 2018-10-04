require "application_system_test_case"

class ArticleSectionsTest < ApplicationSystemTestCase
  setup do
    @article_section = article_sections(:one)
  end

  test "visiting the index" do
    visit article_sections_url
    assert_selector "h1", text: "Article Sections"
  end

  test "creating a Article section" do
    visit article_sections_url
    click_on "New Article Section"

    fill_in "Article", with: @article_section.article_id
    fill_in "Description", with: @article_section.description
    fill_in "Description Markdown", with: @article_section.description_markdown
    fill_in "Section", with: @article_section.section
    fill_in "Seq", with: @article_section.seq
    fill_in "Slug", with: @article_section.slug
    click_on "Create Article section"

    assert_text "Article section was successfully created"
    click_on "Back"
  end

  test "updating a Article section" do
    visit article_sections_url
    click_on "Edit", match: :first

    fill_in "Article", with: @article_section.article_id
    fill_in "Description", with: @article_section.description
    fill_in "Description Markdown", with: @article_section.description_markdown
    fill_in "Section", with: @article_section.section
    fill_in "Seq", with: @article_section.seq
    fill_in "Slug", with: @article_section.slug
    click_on "Update Article section"

    assert_text "Article section was successfully updated"
    click_on "Back"
  end

  test "destroying a Article section" do
    visit article_sections_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Article section was successfully destroyed"
  end
end
