require 'rails_helper'

RSpec.describe MarkdownEditorController, type: :controller do

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  # === Routes (REST) ===
  it { should route(:get, '/markdown_editor/create').to('markdown_editor#create', {}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_xhr_redirected_to) }
  it { should use_before_filter(:set_request_method_cookie) }
  it { should use_before_filter(:authenticate_user!) }
  it { should use_before_filter(:configure_permitted_parameters) }
  # === Callbacks (After) ===
  it { should use_after_filter(:abort_xdomain_redirect) }
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===

end
