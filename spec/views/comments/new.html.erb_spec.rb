require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new())
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do
    end
  end
end
