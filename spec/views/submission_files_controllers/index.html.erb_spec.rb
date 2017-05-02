require 'rails_helper'

RSpec.describe "submission_files_controllers/index", type: :view do
  before(:each) do
    assign(:submission_files_controllers, [
      SubmissionFilesController.create!(),
      SubmissionFilesController.create!()
    ])
  end

  it "renders a list of submission_files_controllers" do
    render
  end
end
