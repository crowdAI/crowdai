require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @article = articles(:dark_skies)
    @update_article = articles(:plant_village)
    sign_in participants(:admin)
  end

  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should get new" do
    get new_article_url
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post articles_url, params: {
        article: {
          article: 'New article',
          category: @article.category,
          published: false,
          summary: @article.summary
        }
      }
    end
    assert_redirected_to article_url(Article.all.order(id: :desc).first.slug)
  end

  test "should show article" do
    get article_url(@article)
    assert_response :success
  end

  test "should get edit" do
    get edit_article_url(@article)
    assert_response :success
  end

  test "should update article" do
    patch article_url(@article), params: {
      article: {
        article: @update_article.article,
        category: @update_article.category,
        published: true,
        summary: @update_article.summary
      }
    }
    @article.reload
    assert_redirected_to article_url(@article.slug)
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete article_url(@article)
    end

    assert_redirected_to articles_url
  end
end
