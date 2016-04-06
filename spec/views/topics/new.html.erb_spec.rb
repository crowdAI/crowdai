require 'rails_helper'

RSpec.describe "topics/new", type: :view do
  before(:each) do
    assign(:topic, Topic.new(
      :challenge => nil,
      :user => nil,
      :topic => "MyString",
      :sticky => false,
      :views => 1,
      :posts_count => 1
    ))
  end

  it "renders new topic form" do
    render

    assert_select "form[action=?][method=?]", topics_path, "post" do

      assert_select "input#topic_challenge_id[name=?]", "topic[challenge_id]"

      assert_select "input#topic_user_id[name=?]", "topic[user_id]"

      assert_select "input#topic_topic[name=?]", "topic[topic]"

      assert_select "input#topic_sticky[name=?]", "topic[sticky]"

      assert_select "input#topic_views[name=?]", "topic[views]"

      assert_select "input#topic_posts_count[name=?]", "topic[posts_count]"
    end
  end
end
