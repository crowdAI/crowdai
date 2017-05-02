require 'rails_helper'

RSpec.describe "active_admin/page_controllers/new", type: :view do
  before(:each) do
    assign(:active_admin_page_controller, ActiveAdmin::PageController.new())
  end

  it "renders new active_admin_page_controller form" do
    render

    assert_select "form[action=?][method=?]", active_admin_page_controllers_path, "post" do
    end
  end
end
