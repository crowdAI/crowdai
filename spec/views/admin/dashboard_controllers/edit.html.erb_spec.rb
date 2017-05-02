require 'rails_helper'

RSpec.describe "admin/dashboard_controllers/edit", type: :view do
  before(:each) do
    @admin_dashboard_controller = assign(:admin_dashboard_controller, Admin::DashboardController.create!())
  end

  it "renders the edit admin_dashboard_controller form" do
    render

    assert_select "form[action=?][method=?]", admin_dashboard_controller_path(@admin_dashboard_controller), "post" do
    end
  end
end
