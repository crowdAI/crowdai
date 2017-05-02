require 'rails_helper'

RSpec.describe "admin/organizers_controllers/index", type: :view do
  before(:each) do
    assign(:admin_organizers_controllers, [
      Admin::OrganizersController.create!(),
      Admin::OrganizersController.create!()
    ])
  end

  it "renders a list of admin/organizers_controllers" do
    render
  end
end
