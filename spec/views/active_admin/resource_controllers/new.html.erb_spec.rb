require 'rails_helper'

RSpec.describe "active_admin/resource_controllers/new", type: :view do
  before(:each) do
    assign(:active_admin_resource_controller, ActiveAdmin::ResourceController.new())
  end

  it "renders new active_admin_resource_controller form" do
    render

    assert_select "form[action=?][method=?]", active_admin_resource_controllers_path, "post" do
    end
  end
end
