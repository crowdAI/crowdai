require 'rails_helper'

RSpec.describe "markdown_editor_controllers/new", type: :view do
  before(:each) do
    assign(:markdown_editor_controller, MarkdownEditorController.new())
  end

  it "renders new markdown_editor_controller form" do
    render

    assert_select "form[action=?][method=?]", markdown_editor_controllers_path, "post" do
    end
  end
end
