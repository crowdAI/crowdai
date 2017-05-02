require 'rails_helper'

RSpec.describe "admin/submissions_controllers/edit", type: :view do
  before(:each) do
    @admin_submissions_controller = assign(:admin_submissions_controller, Admin::SubmissionsController.create!())
  end

  it "renders the edit admin_submissions_controller form" do
    render

    assert_select "form[action=?][method=?]", admin_submissions_controller_path(@admin_submissions_controller), "post" do
    end
  end
end
