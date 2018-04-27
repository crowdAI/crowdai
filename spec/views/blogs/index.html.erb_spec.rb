require 'rails_helper'

RSpec.describe "blogs/index", type: :view do
  before(:each) do
    assign(:blogs, [
      Blog.create!(
        :participant => nil,
        :title => "Title",
        :body => "MyText",
        :published => false,
        :vote_count => 2,
        :view_count => 3
      ),
      Blog.create!(
        :participant => nil,
        :title => "Title",
        :body => "MyText",
        :published => false,
        :vote_count => 2,
        :view_count => 3
      )
    ])
  end

  it "renders a list of blogs" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
