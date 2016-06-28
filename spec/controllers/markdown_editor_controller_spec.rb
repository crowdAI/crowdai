require 'rails_helper'

RSpec.describe MarkdownEditorController, type: :controller do

  describe "markdown preview" do
    it "renders html from markdown" do
      get :show, {format: 'json', data: { markdown_text: "# The description"} }
      it { expect(challenge.description_rendered).to eq("<h3>The description</h3>\n")}
    end
  end

  it { should route(:get, '/markdown_editor/show').to('markdown_editor#show', {}) }
end
