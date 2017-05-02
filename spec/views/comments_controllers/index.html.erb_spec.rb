require 'rails_helper'

RSpec.describe "comments_controllers/index", type: :view do
  before(:each) do
    assign(:comments_controllers, [
      CommentsController.create!(),
      CommentsController.create!()
    ])
  end

  it "renders a list of comments_controllers" do
    render
  end
end
