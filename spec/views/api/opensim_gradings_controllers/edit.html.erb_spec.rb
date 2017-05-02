require 'rails_helper'

RSpec.describe "api/opensim_gradings_controllers/edit", type: :view do
  before(:each) do
    @api_opensim_gradings_controller = assign(:api_opensim_gradings_controller, Api::OpensimGradingsController.create!())
  end

  it "renders the edit api_opensim_gradings_controller form" do
    render

    assert_select "form[action=?][method=?]", api_opensim_gradings_controller_path(@api_opensim_gradings_controller), "post" do
    end
  end
end
