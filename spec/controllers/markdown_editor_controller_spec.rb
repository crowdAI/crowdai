require 'rails_helper'

RSpec.describe MarkdownEditorController, type: :controller do

  describe "markdown preview" do
    it "renders html from markdown" do
      get :show, {format: 'json', data: { markdown_text: "# The description"} }
      it { expect(challenge.description_rendered).to eq("<h3>The description</h3>\n")}
    end
  end


  it { should route(:get, '/markdown_editor/show').to('markdown_editor#show', {}) }
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_xhr_redirected_to) }
  it { should use_before_filter(:set_request_method_cookie) }
  it { should use_before_filter(:authenticate_participant!) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_after_filter(:abort_xdomain_redirect) }
  it { should use_after_filter(:verify_same_origin_request) }



end
