require 'rails_helper'

RSpec.describe "api/external_graders_controllers/edit", type: :view do
  before(:each) do
    @api_external_graders_controller = assign(:api_external_graders_controller, Api::ExternalGradersController.create!())
  end

  it "renders the edit api_external_graders_controller form" do
    render

    assert_select "form[action=?][method=?]", api_external_graders_controller_path(@api_external_graders_controller), "post" do
    end
  end
end
