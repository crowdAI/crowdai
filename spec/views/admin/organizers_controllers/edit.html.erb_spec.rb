require 'rails_helper'

RSpec.describe "admin/organizers_controllers/edit", type: :view do
  before(:each) do
    @admin_organizers_controller = assign(:admin_organizers_controller, Admin::OrganizersController.create!())
  end

  it "renders the edit admin_organizers_controller form" do
    render

    assert_select "form[action=?][method=?]", admin_organizers_controller_path(@admin_organizers_controller), "post" do
    end
  end
end
