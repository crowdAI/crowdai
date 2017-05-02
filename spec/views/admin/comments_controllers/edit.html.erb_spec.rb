require 'rails_helper'

RSpec.describe "admin/comments_controllers/edit", type: :view do
  before(:each) do
    @admin_comments_controller = assign(:admin_comments_controller, Admin::CommentsController.create!())
  end

  it "renders the edit admin_comments_controller form" do
    render

    assert_select "form[action=?][method=?]", admin_comments_controller_path(@admin_comments_controller), "post" do
    end
  end
end
