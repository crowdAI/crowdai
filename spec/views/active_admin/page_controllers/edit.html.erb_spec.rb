require 'rails_helper'

RSpec.describe "active_admin/page_controllers/edit", type: :view do
  before(:each) do
    @active_admin_page_controller = assign(:active_admin_page_controller, ActiveAdmin::PageController.create!())
  end

  it "renders the edit active_admin_page_controller form" do
    render

    assert_select "form[action=?][method=?]", active_admin_page_controller_path(@active_admin_page_controller), "post" do
    end
  end
end
