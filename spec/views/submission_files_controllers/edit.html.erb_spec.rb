require 'rails_helper'

RSpec.describe "submission_files_controllers/edit", type: :view do
  before(:each) do
    @submission_files_controller = assign(:submission_files_controller, SubmissionFilesController.create!())
  end

  it "renders the edit submission_files_controller form" do
    render

    assert_select "form[action=?][method=?]", submission_files_controller_path(@submission_files_controller), "post" do
    end
  end
end
