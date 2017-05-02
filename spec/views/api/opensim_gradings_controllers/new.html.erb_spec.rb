require 'rails_helper'

RSpec.describe "api/opensim_gradings_controllers/new", type: :view do
  before(:each) do
    assign(:api_opensim_gradings_controller, Api::OpensimGradingsController.new())
  end

  it "renders new api_opensim_gradings_controller form" do
    render

    assert_select "form[action=?][method=?]", api_opensim_gradings_controllers_path, "post" do
    end
  end
end
