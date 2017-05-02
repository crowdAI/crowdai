require 'rails_helper'

RSpec.describe "api/submissions_controllers/show", type: :view do
  before(:each) do
    @api_submissions_controller = assign(:api_submissions_controller, Api::SubmissionsController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
