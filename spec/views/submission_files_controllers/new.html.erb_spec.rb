require 'rails_helper'

RSpec.describe "submission_files_controllers/new", type: :view do
  before(:each) do
    assign(:submission_files_controller, SubmissionFilesController.new())
  end

  it "renders new submission_files_controller form" do
    render

    assert_select "form[action=?][method=?]", submission_files_controllers_path, "post" do
    end
  end
end
