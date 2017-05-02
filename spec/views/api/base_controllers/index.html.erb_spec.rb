require 'rails_helper'

RSpec.describe "api/base_controllers/index", type: :view do
  before(:each) do
    assign(:api_base_controllers, [
      Api::BaseController.create!(),
      Api::BaseController.create!()
    ])
  end

  it "renders a list of api/base_controllers" do
    render
  end
end
