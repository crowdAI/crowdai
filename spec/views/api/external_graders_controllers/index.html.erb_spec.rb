require 'rails_helper'

RSpec.describe "api/external_graders_controllers/index", type: :view do
  before(:each) do
    assign(:api_external_graders_controllers, [
      Api::ExternalGradersController.create!(),
      Api::ExternalGradersController.create!()
    ])
  end

  it "renders a list of api/external_graders_controllers" do
    render
  end
end
