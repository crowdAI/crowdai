require 'rails_helper'

RSpec.describe "admin/submissions_controllers/index", type: :view do
  before(:each) do
    assign(:admin_submissions_controllers, [
      Admin::SubmissionsController.create!(),
      Admin::SubmissionsController.create!()
    ])
  end

  it "renders a list of admin/submissions_controllers" do
    render
  end
end
