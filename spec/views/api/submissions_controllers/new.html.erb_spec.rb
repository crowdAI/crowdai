require 'rails_helper'

RSpec.describe "api/submissions_controllers/new", type: :view do
  before(:each) do
    assign(:api_submissions_controller, Api::SubmissionsController.new())
  end

  it "renders new api_submissions_controller form" do
    render

    assert_select "form[action=?][method=?]", api_submissions_controllers_path, "post" do
    end
  end
end
