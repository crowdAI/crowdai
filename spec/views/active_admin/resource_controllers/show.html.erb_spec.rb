require 'rails_helper'

RSpec.describe "active_admin/resource_controllers/show", type: :view do
  before(:each) do
    @active_admin_resource_controller = assign(:active_admin_resource_controller, ActiveAdmin::ResourceController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
