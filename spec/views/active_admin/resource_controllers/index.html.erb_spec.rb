require 'rails_helper'

RSpec.describe "active_admin/resource_controllers/index", type: :view do
  before(:each) do
    assign(:active_admin_resource_controllers, [
      ActiveAdmin::ResourceController.create!(),
      ActiveAdmin::ResourceController.create!()
    ])
  end

  it "renders a list of active_admin/resource_controllers" do
    render
  end
end
