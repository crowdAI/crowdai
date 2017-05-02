require 'rails_helper'

RSpec.describe "active_admin/resource_controllers/edit", type: :view do
  before(:each) do
    @active_admin_resource_controller = assign(:active_admin_resource_controller, ActiveAdmin::ResourceController.create!())
  end

  it "renders the edit active_admin_resource_controller form" do
    render

    assert_select "form[action=?][method=?]", active_admin_resource_controller_path(@active_admin_resource_controller), "post" do
    end
  end
end
