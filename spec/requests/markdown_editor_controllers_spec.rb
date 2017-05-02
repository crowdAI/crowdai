require 'rails_helper'

RSpec.describe "MarkdownEditorControllers", type: :request do
  describe "GET /markdown_editor_controllers" do
    it "works! (now write some real specs)" do
      get markdown_editor_controllers_path
      expect(response).to have_http_status(200)
    end
  end
end
