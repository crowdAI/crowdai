require 'rails_helper'

RSpec.describe "topics/index", type: :view do
  before(:each) do
    assign(:topics, [
      Topic.create!(
        :competition => nil,
        :user => nil,
        :topic => "Topic",
        :sticky => false,
        :views => 1,
        :posts_count => 2
      ),
      Topic.create!(
        :competition => nil,
        :user => nil,
        :topic => "Topic",
        :sticky => false,
        :views => 1,
        :posts_count => 2
      )
    ])
  end

  it "renders a list of topics" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Topic".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
