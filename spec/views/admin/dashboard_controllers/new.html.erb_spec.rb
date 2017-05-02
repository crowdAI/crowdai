require 'rails_helper'

RSpec.describe "admin/dashboard_controllers/new", type: :view do
  before(:each) do
    assign(:admin_dashboard_controller, Admin::DashboardController.new())
  end

  it "renders new admin_dashboard_controller form" do
    render

    assert_select "form[action=?][method=?]", admin_dashboard_controllers_path, "post" do
    end
  end
end
