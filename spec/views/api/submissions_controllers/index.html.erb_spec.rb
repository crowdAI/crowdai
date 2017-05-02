require 'rails_helper'

RSpec.describe "api/submissions_controllers/index", type: :view do
  before(:each) do
    assign(:api_submissions_controllers, [
      Api::SubmissionsController.create!(),
      Api::SubmissionsController.create!()
    ])
  end

  it "renders a list of api/submissions_controllers" do
    render
  end
end
