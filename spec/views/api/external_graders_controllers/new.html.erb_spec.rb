require 'rails_helper'

RSpec.describe "api/external_graders_controllers/new", type: :view do
  before(:each) do
    assign(:api_external_graders_controller, Api::ExternalGradersController.new())
  end

  it "renders new api_external_graders_controller form" do
    render

    assert_select "form[action=?][method=?]", api_external_graders_controllers_path, "post" do
    end
  end
end
