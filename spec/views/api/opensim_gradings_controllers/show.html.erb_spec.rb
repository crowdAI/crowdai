require 'rails_helper'

RSpec.describe "api/opensim_gradings_controllers/show", type: :view do
  before(:each) do
    @api_opensim_gradings_controller = assign(:api_opensim_gradings_controller, Api::OpensimGradingsController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
