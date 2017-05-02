require 'rails_helper'

RSpec.describe "markdown_editor_controllers/show", type: :view do
  before(:each) do
    @markdown_editor_controller = assign(:markdown_editor_controller, MarkdownEditorController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
