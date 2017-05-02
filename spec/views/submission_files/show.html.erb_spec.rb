require 'rails_helper'

RSpec.describe "submission_files/show", type: :view do
  before(:each) do
    @submission_file = assign(:submission_file, SubmissionFile.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
