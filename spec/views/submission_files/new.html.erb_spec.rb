require 'rails_helper'

RSpec.describe "submission_files/new", type: :view do
  before(:each) do
    assign(:submission_file, SubmissionFile.new())
  end

  it "renders new submission_file form" do
    render

    assert_select "form[action=?][method=?]", submission_files_path, "post" do
    end
  end
end
