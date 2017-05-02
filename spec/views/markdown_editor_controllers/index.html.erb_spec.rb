require 'rails_helper'

RSpec.describe "markdown_editor_controllers/index", type: :view do
  before(:each) do
    assign(:markdown_editor_controllers, [
      MarkdownEditorController.create!(),
      MarkdownEditorController.create!()
    ])
  end

  it "renders a list of markdown_editor_controllers" do
    render
  end
end
