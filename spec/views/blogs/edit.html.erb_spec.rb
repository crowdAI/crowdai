require 'rails_helper'

RSpec.describe "blogs/edit", type: :view do
  before(:each) do
    @blog = assign(:blog, Blog.create!(
      :participant => nil,
      :title => "MyString",
      :body => "MyText",
      :published => false,
      :vote_count => 1,
      :view_count => 1
    ))
  end

  it "renders the edit blog form" do
    render

    assert_select "form[action=?][method=?]", blog_path(@blog), "post" do

      assert_select "input[name=?]", "blog[participant_id]"

      assert_select "input[name=?]", "blog[title]"

      assert_select "textarea[name=?]", "blog[body]"

      assert_select "input[name=?]", "blog[published]"

      assert_select "input[name=?]", "blog[vote_count]"

      assert_select "input[name=?]", "blog[view_count]"
    end
  end
end
