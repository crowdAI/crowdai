require 'rails_helper'

RSpec.describe "submission_files/index", type: :view do
  before(:each) do
    assign(:submission_files, [
      SubmissionFile.create!(),
      SubmissionFile.create!()
    ])
  end

  it "renders a list of submission_files" do
    render
  end
end
