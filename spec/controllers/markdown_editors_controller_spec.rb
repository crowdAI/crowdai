require 'rails_helper'

RSpec.describe MarkdownEditorsController, type: :controller do

  let!(:participant) { create :participant }

  before do
    sign_in participant
  end

  describe "GET #index" do
    it "assigns the requested markdown_editor_controller as @markdown_editor_controller" do
      get :index, params: { markdown: { markdown_text: '**Bolded**'} }
      expect(assigns(:markdown_text).strip).to eq('<p><strong>Bolded</strong></p>')
    end
  end

end
