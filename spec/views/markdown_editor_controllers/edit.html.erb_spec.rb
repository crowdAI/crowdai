require 'rails_helper'

RSpec.describe "markdown_editor_controllers/edit", type: :view do
  before(:each) do
    @markdown_editor_controller = assign(:markdown_editor_controller, MarkdownEditorController.create!())
  end

  it "renders the edit markdown_editor_controller form" do
    render

    assert_select "form[action=?][method=?]", markdown_editor_controller_path(@markdown_editor_controller), "post" do
    end
  end
end
