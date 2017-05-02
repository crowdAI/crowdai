require 'rails_helper'

RSpec.describe "api/external_graders_controllers/show", type: :view do
  before(:each) do
    @api_external_graders_controller = assign(:api_external_graders_controller, Api::ExternalGradersController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
