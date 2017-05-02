require 'rails_helper'

RSpec.describe "organizers_controllers/show", type: :view do
  before(:each) do
    @organizers_controller = assign(:organizers_controller, OrganizersController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
