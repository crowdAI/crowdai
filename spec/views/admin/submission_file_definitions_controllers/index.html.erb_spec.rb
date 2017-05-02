require 'rails_helper'

RSpec.describe "admin/submission_file_definitions_controllers/index", type: :view do
  before(:each) do
    assign(:admin_submission_file_definitions_controllers, [
      Admin::SubmissionFileDefinitionsController.create!(),
      Admin::SubmissionFileDefinitionsController.create!()
    ])
  end

  it "renders a list of admin/submission_file_definitions_controllers" do
    render
  end
end
