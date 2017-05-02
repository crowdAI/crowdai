require 'rails_helper'

RSpec.describe "submission_files_controllers/show", type: :view do
  before(:each) do
    @submission_files_controller = assign(:submission_files_controller, SubmissionFilesController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
