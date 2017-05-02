require 'rails_helper'

RSpec.describe "admin/organizers_controllers/new", type: :view do
  before(:each) do
    assign(:admin_organizers_controller, Admin::OrganizersController.new())
  end

  it "renders new admin_organizers_controller form" do
    render

    assert_select "form[action=?][method=?]", admin_organizers_controllers_path, "post" do
    end
  end
end
