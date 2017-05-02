require 'rails_helper'

RSpec.describe "active_admin/base_controllers/new", type: :view do
  before(:each) do
    assign(:active_admin_base_controller, ActiveAdmin::BaseController.new())
  end

  it "renders new active_admin_base_controller form" do
    render

    assert_select "form[action=?][method=?]", active_admin_base_controllers_path, "post" do
    end
  end
end
