require 'rails_helper'

RSpec.describe "admin/dashboard_controllers/show", type: :view do
  before(:each) do
    @admin_dashboard_controller = assign(:admin_dashboard_controller, Admin::DashboardController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
