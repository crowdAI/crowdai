require 'rails_helper'

RSpec.describe "admin/submission_file_definitions_controllers/new", type: :view do
  before(:each) do
    assign(:admin_submission_file_definitions_controller, Admin::SubmissionFileDefinitionsController.new())
  end

  it "renders new admin_submission_file_definitions_controller form" do
    render

    assert_select "form[action=?][method=?]", admin_submission_file_definitions_controllers_path, "post" do
    end
  end
end
