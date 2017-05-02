require 'rails_helper'

RSpec.describe "active_admin/base_controllers/index", type: :view do
  before(:each) do
    assign(:active_admin_base_controllers, [
      ActiveAdmin::BaseController.create!(),
      ActiveAdmin::BaseController.create!()
    ])
  end

  it "renders a list of active_admin/base_controllers" do
    render
  end
end
