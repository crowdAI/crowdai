require 'rails_helper'

RSpec.describe "organizers_controllers/edit", type: :view do
  before(:each) do
    @organizers_controller = assign(:organizers_controller, OrganizersController.create!())
  end

  it "renders the edit organizers_controller form" do
    render

    assert_select "form[action=?][method=?]", organizers_controller_path(@organizers_controller), "post" do
    end
  end
end
