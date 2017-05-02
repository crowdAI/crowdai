require 'rails_helper'

RSpec.describe "admin/organizers_controllers/show", type: :view do
  before(:each) do
    @admin_organizers_controller = assign(:admin_organizers_controller, Admin::OrganizersController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
