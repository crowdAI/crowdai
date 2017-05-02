require 'rails_helper'

RSpec.describe "admin/submission_file_definitions_controllers/edit", type: :view do
  before(:each) do
    @admin_submission_file_definitions_controller = assign(:admin_submission_file_definitions_controller, Admin::SubmissionFileDefinitionsController.create!())
  end

  it "renders the edit admin_submission_file_definitions_controller form" do
    render

    assert_select "form[action=?][method=?]", admin_submission_file_definitions_controller_path(@admin_submission_file_definitions_controller), "post" do
    end
  end
end
