require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :topic => nil,
        :user => nil,
        :post => "MyText",
        :votes => 1,
        :flagged => false,
        :notify => false
      ),
      Post.create!(
        :topic => nil,
        :user => nil,
        :post => "MyText",
        :votes => 1,
        :flagged => false,
        :notify => false
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
