require 'rails_helper'

RSpec.describe "submissions_controllers/index", type: :view do
  before(:each) do
    assign(:submissions_controllers, [
      SubmissionsController.create!(),
      SubmissionsController.create!()
    ])
  end

  it "renders a list of submissions_controllers" do
    render
  end
end
