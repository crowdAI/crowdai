require 'rails_helper'

RSpec.describe "api/base_controllers/show", type: :view do
  before(:each) do
    @api_base_controller = assign(:api_base_controller, Api::BaseController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
