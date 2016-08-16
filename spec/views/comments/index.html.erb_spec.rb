require 'rails_helper'

RSpec.describe "comments/index", type: :view do
  before(:each) do
    assign(:comments, [
      Comment.create!(),
      Comment.create!()
    ])
  end

  it "renders a list of comments" do
    render
  end
end
