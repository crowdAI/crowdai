require 'rails_helper'

RSpec.describe "organizers_controllers/new", type: :view do
  before(:each) do
    assign(:organizers_controller, OrganizersController.new())
  end

  it "renders new organizers_controller form" do
    render

    assert_select "form[action=?][method=?]", organizers_controllers_path, "post" do
    end
  end
end
