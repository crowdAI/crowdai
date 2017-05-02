require 'rails_helper'

RSpec.describe "comments_controllers/edit", type: :view do
  before(:each) do
    @comments_controller = assign(:comments_controller, CommentsController.create!())
  end

  it "renders the edit comments_controller form" do
    render

    assert_select "form[action=?][method=?]", comments_controller_path(@comments_controller), "post" do
    end
  end
end
