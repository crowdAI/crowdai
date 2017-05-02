require 'rails_helper'

RSpec.describe "admin/comments_controllers/show", type: :view do
  before(:each) do
    @admin_comments_controller = assign(:admin_comments_controller, Admin::CommentsController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
