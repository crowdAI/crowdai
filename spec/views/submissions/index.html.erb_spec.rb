require 'rails_helper'

RSpec.describe "submissions/index", type: :view do
  before(:each) do
    assign(:submissions, [
      Submission.create!(),
      Submission.create!()
    ])
  end

  it "renders a list of submissions" do
    render
  end
end
