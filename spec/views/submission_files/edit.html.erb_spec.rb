require 'rails_helper'

RSpec.describe "submission_files/edit", type: :view do
  before(:each) do
    @submission_file = assign(:submission_file, SubmissionFile.create!())
  end

  it "renders the edit submission_file form" do
    render

    assert_select "form[action=?][method=?]", submission_file_path(@submission_file), "post" do
    end
  end
end
