require 'rails_helper'

RSpec.describe "api/opensim_gradings_controllers/index", type: :view do
  before(:each) do
    assign(:api_opensim_gradings_controllers, [
      Api::OpensimGradingsController.create!(),
      Api::OpensimGradingsController.create!()
    ])
  end

  it "renders a list of api/opensim_gradings_controllers" do
    render
  end
end
