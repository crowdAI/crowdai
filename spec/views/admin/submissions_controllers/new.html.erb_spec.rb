require 'rails_helper'

RSpec.describe "admin/submissions_controllers/new", type: :view do
  before(:each) do
    assign(:admin_submissions_controller, Admin::SubmissionsController.new())
  end

  it "renders new admin_submissions_controller form" do
    render

    assert_select "form[action=?][method=?]", admin_submissions_controllers_path, "post" do
    end
  end
end
