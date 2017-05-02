require 'rails_helper'

RSpec.describe "comments_controllers/new", type: :view do
  before(:each) do
    assign(:comments_controller, CommentsController.new())
  end

  it "renders new comments_controller form" do
    render

    assert_select "form[action=?][method=?]", comments_controllers_path, "post" do
    end
  end
end
