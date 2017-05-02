require 'rails_helper'

RSpec.describe "admin/comments_controllers/index", type: :view do
  before(:each) do
    assign(:admin_comments_controllers, [
      Admin::CommentsController.create!(),
      Admin::CommentsController.create!()
    ])
  end

  it "renders a list of admin/comments_controllers" do
    render
  end
end
