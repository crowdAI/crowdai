require 'rails_helper'

RSpec.describe "admin/submissions_controllers/show", type: :view do
  before(:each) do
    @admin_submissions_controller = assign(:admin_submissions_controller, Admin::SubmissionsController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
