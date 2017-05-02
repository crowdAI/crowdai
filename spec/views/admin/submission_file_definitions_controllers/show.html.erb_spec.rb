require 'rails_helper'

RSpec.describe "admin/submission_file_definitions_controllers/show", type: :view do
  before(:each) do
    @admin_submission_file_definitions_controller = assign(:admin_submission_file_definitions_controller, Admin::SubmissionFileDefinitionsController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
