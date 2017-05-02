require 'rails_helper'

RSpec.describe "admin/dashboard_controllers/index", type: :view do
  before(:each) do
    assign(:admin_dashboard_controllers, [
      Admin::DashboardController.create!(),
      Admin::DashboardController.create!()
    ])
  end

  it "renders a list of admin/dashboard_controllers" do
    render
  end
end
