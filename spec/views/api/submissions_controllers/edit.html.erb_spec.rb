require 'rails_helper'

RSpec.describe "api/submissions_controllers/edit", type: :view do
  before(:each) do
    @api_submissions_controller = assign(:api_submissions_controller, Api::SubmissionsController.create!())
  end

  it "renders the edit api_submissions_controller form" do
    render

    assert_select "form[action=?][method=?]", api_submissions_controller_path(@api_submissions_controller), "post" do
    end
  end
end
