require 'rails_helper'

RSpec.describe "api/base_controllers/new", type: :view do
  before(:each) do
    assign(:api_base_controller, Api::BaseController.new())
  end

  it "renders new api_base_controller form" do
    render

    assert_select "form[action=?][method=?]", api_base_controllers_path, "post" do
    end
  end
end
