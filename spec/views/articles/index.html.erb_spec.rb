require 'rails_helper'

RSpec.describe "articles/index", type: :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        :article => "Article",
        :participant => nil,
        :published => false,
        :vote_count => 1,
        :category => "Category",
        :view_count => 2,
        :comment_count => 3,
        :summary => "Summary",
        :slug => "Slug"
      ),
      Article.create!(
        :article => "Article",
        :participant => nil,
        :published => false,
        :vote_count => 1,
        :category => "Category",
        :view_count => 2,
        :comment_count => 3,
        :summary => "Summary",
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "tr>td", :text => "Article".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Summary".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
