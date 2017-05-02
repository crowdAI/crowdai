require 'rails_helper'

RSpec.describe "organizers_controllers/index", type: :view do
  before(:each) do
    assign(:organizers_controllers, [
      OrganizersController.create!(),
      OrganizersController.create!()
    ])
  end

  it "renders a list of organizers_controllers" do
    render
  end
end
