require 'test_helper'

class ArticleSectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article_section = article_sections(:one)
  end

  test "should get index" do
    get article_sections_url
    assert_response :success
  end

  test "should get new" do
    get new_article_section_url
    assert_response :success
  end

  test "should create article_section" do
    assert_difference('ArticleSection.count') do
      post article_sections_url, params: { article_section: { article_id: @article_section.article_id, description: @article_section.description, description_markdown: @article_section.description_markdown, section: @article_section.section, seq: @article_section.seq, slug: @article_section.slug } }
    end

    assert_redirected_to article_section_url(ArticleSection.last)
  end

  test "should show article_section" do
    get article_section_url(@article_section)
    assert_response :success
  end

  test "should get edit" do
    get edit_article_section_url(@article_section)
    assert_response :success
  end

  test "should update article_section" do
    patch article_section_url(@article_section), params: { article_section: { article_id: @article_section.article_id, description: @article_section.description, description_markdown: @article_section.description_markdown, section: @article_section.section, seq: @article_section.seq, slug: @article_section.slug } }
    assert_redirected_to article_section_url(@article_section)
  end

  test "should destroy article_section" do
    assert_difference('ArticleSection.count', -1) do
      delete article_section_url(@article_section)
    end

    assert_redirected_to article_sections_url
  end
end
