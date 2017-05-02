require 'rails_helper'

RSpec.describe "admin/comments_controllers/new", type: :view do
  before(:each) do
    assign(:admin_comments_controller, Admin::CommentsController.new())
  end

  it "renders new admin_comments_controller form" do
    render

    assert_select "form[action=?][method=?]", admin_comments_controllers_path, "post" do
    end
  end
end
