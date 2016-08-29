require 'rails_helper'

RSpec.describe "articles/new", type: :view do
  before(:each) do
    assign(:article, Article.new(
      :article => "MyString",
      :participant => nil,
      :published => false,
      :vote_count => 1,
      :category => "MyString",
      :view_count => 1,
      :comment_count => 1,
      :summary => "MyString",
      :slug => "MyString"
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input#article_article[name=?]", "article[article]"

      assert_select "input#article_participant_id[name=?]", "article[participant_id]"

      assert_select "input#article_published[name=?]", "article[published]"

      assert_select "input#article_vote_count[name=?]", "article[vote_count]"

      assert_select "input#article_category[name=?]", "article[category]"

      assert_select "input#article_view_count[name=?]", "article[view_count]"

      assert_select "input#article_comment_count[name=?]", "article[comment_count]"

      assert_select "input#article_summary[name=?]", "article[summary]"

      assert_select "input#article_slug[name=?]", "article[slug]"
    end
  end
end
