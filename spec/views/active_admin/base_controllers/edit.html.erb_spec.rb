require 'rails_helper'

RSpec.describe "active_admin/base_controllers/edit", type: :view do
  before(:each) do
    @active_admin_base_controller = assign(:active_admin_base_controller, ActiveAdmin::BaseController.create!())
  end

  it "renders the edit active_admin_base_controller form" do
    render

    assert_select "form[action=?][method=?]", active_admin_base_controller_path(@active_admin_base_controller), "post" do
    end
  end
end
