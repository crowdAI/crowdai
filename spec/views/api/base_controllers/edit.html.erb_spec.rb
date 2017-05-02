require 'rails_helper'

RSpec.describe "api/base_controllers/edit", type: :view do
  before(:each) do
    @api_base_controller = assign(:api_base_controller, Api::BaseController.create!())
  end

  it "renders the edit api_base_controller form" do
    render

    assert_select "form[action=?][method=?]", api_base_controller_path(@api_base_controller), "post" do
    end
  end
end
