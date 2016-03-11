require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :topic => nil,
      :user => nil,
      :post => "MyText",
      :votes => 1,
      :flagged => false,
      :notify => false
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input#post_topic_id[name=?]", "post[topic_id]"

      assert_select "input#post_user_id[name=?]", "post[user_id]"

      assert_select "textarea#post_post[name=?]", "post[post]"

      assert_select "input#post_votes[name=?]", "post[votes]"

      assert_select "input#post_flagged[name=?]", "post[flagged]"

      assert_select "input#post_notify[name=?]", "post[notify]"
    end
  end
end
